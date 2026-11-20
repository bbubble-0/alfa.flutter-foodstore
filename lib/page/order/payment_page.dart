import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  final String snapToken;

  const PaymentPage({
    super.key,
    required this.snapToken,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isOpening = false;
  String? _errorMessage;

  String get _paymentUrl =>
      'https://app.sandbox.midtrans.com/snap/v2/vtweb/${widget.snapToken.trim()}';

  Future<void> _openPayment() async {
    final token = widget.snapToken.trim();

    debugPrint('SNAP TOKEN: $token');
    debugPrint('PAYMENT URL: $_paymentUrl');

    if (token.isEmpty) {
      setState(() {
        _errorMessage = 'Snap token kosong. Transaksi belum menghasilkan token pembayaran.';
      });
      return;
    }

    setState(() {
      _isOpening = true;
      _errorMessage = null;
    });

    try {
      final uri = Uri.parse(_paymentUrl);

      final success = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );

      if (!success && mounted) {
        setState(() {
          _errorMessage = 'Gagal membuka halaman pembayaran Midtrans.';
        });
      }
    } catch (e) {
      debugPrint('PAYMENT ERROR: $e');

      if (mounted) {
        setState(() {
          _errorMessage = 'Terjadi kesalahan: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isOpening = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.payment,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              const Text(
                'Pembayaran Midtrans',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Klik tombol di bawah untuk membuka halaman pembayaran '
                'Midtrans dan menyelesaikan transaksi kamu.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isOpening ? null : _openPayment,
                  icon: const Icon(Icons.open_in_browser),
                  label: Text(
                    _isOpening
                        ? 'Membuka pembayaran...'
                        : 'Bayar Sekarang',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Kembali ke aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}