import 'package:banana_challenge/models/product_detail_model.dart';
import 'package:banana_challenge/models/product_model.dart';
import 'package:banana_challenge/services/products_service.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  final ProductsService productService = ProductsService();
  List<ProductModel> products = [];
  ProductDetailModel productDetail = ProductDetailModel(
      id: 0, description: "", category: "", price: 0, stock: 0, images: []);
  bool isLoading = false;

  Future<void> getProducts() async {
    isLoading = true;
    products = await productService.getProducts();
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchProducts(String query) async {
    isLoading = true;
    products = await productService.searchProducts(query);
    isLoading = false;
    notifyListeners();
  }
}
