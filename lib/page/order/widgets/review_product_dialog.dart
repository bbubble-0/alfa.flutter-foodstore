import 'package:flutter/material.dart';
import 'package:flutter_application/resource/remote/order_remote_resource.dart';

class ReviewProductDialog extends StatefulWidget {
  final OrderRemoteResource orderRemoteResource;
  final int transactionDetailId;
  final int productId;
  final String productName;

  const ReviewProductDialog({
    super.key,
    required this.orderRemoteResource,
    required this.transactionDetailId,
    required this.productId,
    required this.productName,
  });

  @override
  State<ReviewProductDialog> createState() => _ReviewProductDialogState();
}

class _ReviewProductDialogState extends State<ReviewProductDialog> {
  final TextEditingController _reviewController = TextEditingController();
  int _rating = 5;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    setState(() => _isSubmitting = true);

    final result = await widget.orderRemoteResource.reviewProduct(
      transactionDetailId: widget.transactionDetailId,
      productId: widget.productId,
      rating: _rating,
      review: _reviewController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    result.fold(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        Navigator.of(context).pop(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Review ${widget.productName}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating'),
            const SizedBox(height: 6),
            Row(
              children: List.generate(5, (index) {
                final starValue = index + 1;
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: _isSubmitting
                      ? null
                      : () => setState(() => _rating = starValue),
                  icon: Icon(
                    starValue <= _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Write your review',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submitReview,
          child: _isSubmitting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Submit'),
        ),
      ],
    );
  }
}