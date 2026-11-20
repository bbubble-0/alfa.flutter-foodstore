
import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cart/cart_bloc.dart';
import 'package:flutter_application/bloc/checkout/checkout_cubit.dart';
import 'package:flutter_application/bloc/location/location_cubit.dart';
import 'package:flutter_application/bloc/shipping_cost/shipping_cost_cubit.dart';
import 'package:flutter_application/core/utils/currency_helper.dart';
import 'package:flutter_application/resource/model/checkout_model.dart';
import 'package:flutter_application/resource/model/location_model.dart';
import 'package:flutter_application/resource/model/shipping_cost_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatefulWidget {
  final int totalPrice;
  final int totalWeight;

  const CheckoutPage({
    super.key,
    required this.totalPrice,
    required this.totalWeight,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _searchLocationController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  LocationModel? _selectedLocation;
  String? _selectedCourier;
  ShippingCostModel? _selectedService;

  bool _locationChosen = false;

  int get _shippingCost => _selectedService?.cost ?? 0;
  int get _grandTotal => widget.totalPrice + _shippingCost;

  @override
  void dispose() {
    _searchLocationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _selectedLocation = null;
      _selectedCourier = null;
      _selectedService = null;
      _locationChosen = false;
    });

    context.read<ShippingCostCubit>().resetShippingCost();

    final query = value.trim();

    if (query.isEmpty) {
      context.read<LocationCubit>().clearLocation();
    } else {
      context.read<LocationCubit>().getLocation(query);
    }
  }

  void _selectLocation(LocationModel location) {
    setState(() {
      _selectedLocation = location;
      _locationChosen = true;
      _selectedCourier = null;
      _selectedService = null;
      _searchLocationController.text = location.label ?? '';
    });

    context.read<ShippingCostCubit>().resetShippingCost();
  }

  void _onCourierChanged(String? courierCode) {
    setState(() {
      _selectedCourier = courierCode;
      _selectedService = null;
    });

    context.read<ShippingCostCubit>().resetShippingCost();

    if (courierCode != null && _selectedLocation?.id != null) {
      context.read<ShippingCostCubit>().getShippingCost(
        _selectedLocation!.id!,
        widget.totalWeight > 0 ? widget.totalWeight : 1000,
        courierCode,
      );
    }
  }

  void _selectShippingService(ShippingCostModel service) {
    setState(() {
      _selectedService = service;
    });
  }

  void _onConfirmAndPay(BuildContext context) {
    final fullAddress = _addressController.text.trim();

    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih lokasi tujuan terlebih dahulu')),
      );
      return;
    }

    if (fullAddress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Isi alamat lengkap terlebih dahulu')),
      );
      return;
    }

    if (_selectedCourier == null || _selectedService == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih layanan pengiriman terlebih dahulu')),
      );
      return;
    }

    final checkoutData = CheckoutModel(
      destinationId: _selectedLocation!.id,
      provinceName: _selectedLocation!.provinceName,
      cityName: _selectedLocation!.cityName,
      districtName: _selectedLocation!.districtName,
      subdistrictName: _selectedLocation!.subdistrictName,
      zipCode: _selectedLocation!.zipCode,
      fullAddress: fullAddress,
      weight: widget.totalWeight > 0 ? widget.totalWeight : 1000,
      shippingCourier: _selectedCourier,
      shippingService: _selectedService!.service,
      shippingCost: _shippingCost,
      total: _grandTotal,
    );

    context.read<CheckoutCubit>().checkout(checkoutData);
  }

  Widget _buildLocationResults() {
    if (_searchLocationController.text.trim().isEmpty || _locationChosen) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (message) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Gagal mencari lokasi: $message',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          loaded: (locations) {
            if (locations.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Lokasi tidak ditemukan'),
              );
            }

            return Container(
              margin: const EdgeInsets.only(top: 8),
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: locations.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final location = locations[index];

                  return ListTile(
                    dense: true,
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    title: Text(location.label ?? 'Lokasi'),
                    onTap: () => _selectLocation(location),
                  );
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSelectedLocation() {
    if (_selectedLocation == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _selectedLocation!.label ?? 'Lokasi terpilih',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            tooltip: 'Ganti lokasi',
            icon: const Icon(Icons.edit_location_alt_outlined),
            onPressed: () {
              setState(() {
                _locationChosen = false;
                _selectedLocation = null;
                _selectedCourier = null;
                _selectedService = null;
                _searchLocationController.clear();
              });
              context.read<LocationCubit>().clearLocation();
              context.read<ShippingCostCubit>().resetShippingCost();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShippingServices() {
    if (_selectedLocation == null || _selectedCourier == null) {
      return const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'Pilih lokasi dan kurir terlebih dahulu.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return BlocBuilder<ShippingCostCubit, ShippingCostState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (message) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Gagal memuat ongkir: $message',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          loaded: (shippingCosts) {
            if (shippingCosts.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Tidak ada layanan ongkir tersedia.'),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Pilih Layanan:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...shippingCosts.map((service) {
                  final isSelected = _selectedService == service;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    color: isSelected ? Colors.blue.shade50 : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: isSelected
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: ListTile(
                      onTap: () => _selectShippingService(service),
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                      title: Text(
                        '${service.service ?? '-'} - ${service.name ?? _selectedCourier!.toUpperCase()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${service.description ?? ''}\nEstimasi: ${service.etd ?? '-'}',
                      ),
                      trailing: Text(
                        CurrencyHelper.formatRupiah(service.cost ?? 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal Produk:'),
                Text(CurrencyHelper.formatRupiah(widget.totalPrice)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ongkos Kirim:'),
                Text(CurrencyHelper.formatRupiah(_shippingCost)),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Grand Total:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  CurrencyHelper.formatRupiah(_grandTotal),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        final name = state.runtimeType.toString();

        if (name.contains('Success')) {
  final snapToken = state.maybeWhen(
    success: (message) => message,
    orElse: () => '',
  );

  context.read<CartBloc>().add(const CartEvent.fetchCart());

  context.push('/payment', extra: snapToken);
} else if (name.contains('Error')) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Proses checkout gagal')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Pengiriman',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _searchLocationController,
                        decoration: InputDecoration(
                          labelText: 'Cari Kota / Kecamatan / Kelurahan',
                          hintText: 'Ketik nama lokasi tujuan',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchLocationController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchLocationController.clear();
                                    _onSearchChanged('');
                                  },
                                )
                              : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                      _buildLocationResults(),
                      _buildSelectedLocation(),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _addressController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Alamat Lengkap',
                          hintText: 'Nama jalan, nomor rumah, RT/RW, patokan',
                          prefixIcon: Icon(Icons.home_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.local_shipping_outlined),
                          SizedBox(width: 8),
                          Text(
                            'Metode Pengiriman',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedCourier,
                        decoration: const InputDecoration(
                          labelText: 'Pilih Kurir',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'jne', child: Text('JNE')),
                          DropdownMenuItem(value: 'pos', child: Text('POS Indonesia')),
                          DropdownMenuItem(value: 'tiki', child: Text('TIKI')),
                          DropdownMenuItem(value: 'jnt', child: Text('J&T')),
                        ],
                        onChanged:
                            _selectedLocation == null ? null : _onCourierChanged,
                      ),
                      _buildShippingServices(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSummary(),
              const SizedBox(height: 20),
              BlocBuilder<CheckoutCubit, CheckoutState>(
                builder: (context, state) {
                  final isLoading =
                      state.runtimeType.toString().contains('Loading');

                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () => _onConfirmAndPay(context),
                      icon: isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.payment),
                      label: Text(
                        isLoading ? 'Memproses...' : 'Confirm and Pay',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
