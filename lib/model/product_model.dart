class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stock;
  final String? image;

  const ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final rawPrice = json['price'];
    final rawStock = json['stock'];

    return ProductModel(
      id: json['id'] as int?,
      name: (json['name'] ?? json['title']) as String?,
      description: json['description'] as String?,
      price: rawPrice is int
          ? rawPrice
          : int.tryParse(rawPrice?.toString() ?? ''),
      stock: rawStock is int
          ? rawStock
          : int.tryParse(rawStock?.toString() ?? ''),
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'image': image,
    };
  }
}