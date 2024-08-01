import 'dart:convert';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String? brand;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.thumbnail,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        brand: json["brand"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "brand": brand,
        "thumbnail": thumbnail,
      };
}
