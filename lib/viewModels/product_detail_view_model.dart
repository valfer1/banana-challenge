import 'package:banana_challenge/models/product_detail_model.dart';
import 'package:banana_challenge/services/products_service.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final ProductsService productService = ProductsService();
  ProductDetailModel productDetail = ProductDetailModel(
      id: 0, description: "", category: "", price: 0, stock: 0, images: []);
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getProductDetail(int id) async {
    _isLoading = true;
    productDetail = await productService.getProductDetail(id);
    print(productDetail);
    _isLoading = false;
    notifyListeners();
  }
}
