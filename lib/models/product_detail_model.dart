import 'dart:convert';

class ProductDetailModel {
  final int id;
  final String description;
  final String category;
  final double price;
  final int stock;
  final List<String> images;

  ProductDetailModel({
    required this.id,
    required this.description,
    required this.category,
    required this.price,
    required this.stock,
    required this.images,
  });

  factory ProductDetailModel.fromRawJson(String str) =>
      ProductDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "category": category,
        "price": price,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
