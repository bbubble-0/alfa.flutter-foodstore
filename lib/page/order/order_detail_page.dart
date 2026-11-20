import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/order/order_cubit.dart';
import 'package:flutter_application/core/constants/app_config.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/page/order/widgets/review_product_dialog.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:flutter_application/resource/remote/order_remote_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatefulWidget {
  final String? snapToken;
  final OrderModel? order;

  const OrderDetailPage({
    super.key,
    this.snapToken,
    this.order,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy').format(date);
  }

  bool _canReview(String? status) {
    switch (status?.toLowerCase()) {
      case 'success':
      case 'completed':
      case 'settlement':
      case 'paid':
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final statusText = order?.status ?? 'Pending';
    final isPending = statusText.toLowerCase() == 'pending';
    final canReview = _canReview(statusText);
    final token = widget.snapToken ?? order?.snapToken ?? '';

    final deliveryAddress = [
      order?.fullAddress,
      order?.subdistrictName,
      order?.districtName,
      order?.provinceName,
      order?.zipCode,
    ].where((e) => e != null && e.toString().trim().isNotEmpty).join(', ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/dashboard/order');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _infoRow('Invoice Number', order?.invoiceNumber ?? '-'),
            _infoRow('Order Date', _formatDate(order?.createdAt)),
            _infoRow('Status', statusText),
            _infoRow(
              'Grand Total',
              CurrencyHelper.formatRupiah(order?.totalPrice),
            ),
            const Divider(height: 24),
            const Text(
              'Delivery Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(deliveryAddress.isEmpty ? '-' : deliveryAddress),
            const Divider(height: 24),
            const Text(
              'Shipping Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _infoRow('Courier', order?.courier ?? '-'),
            _infoRow(
              'Cost',
              (order?.shippingCost ?? 0).toStringAsFixed(2),
            ),
            _infoRow('Service', order?.service ?? '-'),
            const Divider(height: 24),
            const Text(
              'Ordered Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('Ordered Items'),
                subtitle: const Text('Quantity: 1'),
                trailing: canReview
                    ? TextButton(
                        onPressed: () async {
                          final remoteResource = OrderRemoteResource(
                            Dio(BaseOptions(baseUrl: AppConfig.API_PATH)),
                          );
                          await showDialog<bool>(
                            context: context,
                            builder: (_) => ReviewProductDialog(
                              orderRemoteResource: remoteResource,
                              transactionDetailId: order?.id ?? 0,
                              productId: order?.id ?? 0,
                              productName: order?.invoiceNumber ?? 'Product',
                            ),
                          );
                        },
                        child: const Text('Review'),
                      )
                    : const Text('Rp 0'),
              ),
            ),
            const SizedBox(height: 20),
            if (isPending)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final paid = await context.push<bool>(
                      '/payment',
                      extra: token,
                    );
                    if (paid == true && context.mounted) {
                      context.read<OrderCubit>().fetchOrders(isRefresh: true);
                    }
                  },
                  child: const Text('Payment'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}