import 'package:flutter/material.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/order_model.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.order,
    this.onTap,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy').format(date);
  }

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'success':
      case 'paid':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'expired':
      case 'cancelled':
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusText = order.status ?? '-';
    final badgeColor = _statusColor(statusText);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.invoiceNumber ?? 'INV-0000',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    statusText,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: badgeColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Date: ${_formatDate(order.createdAt)}',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 4),
              Text(
                'Total: ${CurrencyHelper.formatRupiah(order.totalPrice)}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}