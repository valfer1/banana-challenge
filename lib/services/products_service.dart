import 'dart:convert';

import 'package:banana_challenge/models/product_detail_model.dart';
import 'package:banana_challenge/models/product_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<List<ProductModel>> getProducts() async {
    try {
      final url = Uri.parse("https://dummyjson.com/products");
      final response = await http.get(url);
      final data = json.decode(response.body);
      final List<ProductModel> productsList = data["products"]
          .map<ProductModel>((prod) => ProductModel.fromJson(prod))
          .toList();

      return productsList;
    } catch (e) {
      return [];
    }
  }

  Future<ProductDetailModel> getProductDetail(int id) async {
    try {
      final url = Uri.parse("https://dummyjson.com/products/$id");
      final response = await http.get(url);
      final data = json.decode(response.body);
      final ProductDetailModel productModel = ProductDetailModel.fromJson(data);

      return productModel;
    } catch (e) {
      return ProductDetailModel(
          id: 0, description: "", category: "", price: 0, stock: 0, images: []);
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final url = Uri.parse("https://dummyjson.com/products/search?q=$query");
      final response = await http.get(url);
      final data = json.decode(response.body);
      final List<ProductModel> productsList = data["products"]
          .map<ProductModel>((prod) => ProductModel.fromJson(prod))
          .toList();

      return productsList;
    } catch (e) {
      return [];
    }
  }
}
