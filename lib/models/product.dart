
class Product {
  final int? id;
  final String name;
  final String sku;
  final String category;
  final int quantity;
  final double purchasePrice;
  final double salePrice;

  Product({
    this.id,
    required this.name,
    required this.sku,
    required this.category,
    required this.quantity,
    required this.purchasePrice,
    required this.salePrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'category': category,
      'quantity': quantity,
      'purchase_price': purchasePrice,
      'sale_price': salePrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      sku: map['sku'] as String,
      category: map['category'] as String,
      quantity: map['quantity'] as int,
      purchasePrice: (map['purchase_price'] as num).toDouble(),
      salePrice: (map['sale_price'] as num).toDouble(),
    );
  }
}
