class OrderModel {
  final int? id;
  final String? code;
  final int? total;
  final String? status;
  final String? snapToken;

  const OrderModel({
    this.id,
    this.code,
    this.total,
    this.status,
    this.snapToken,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      total: json['total'] as int?,
      status: json['status'] as String?,
      snapToken: json['snap_token'] as String? ?? json['snapToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'total': total,
      'status': status,
      'snap_token': snapToken,
    };
  }
}