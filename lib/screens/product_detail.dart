import 'package:banana_challenge/components/custom_button.dart';
import 'package:banana_challenge/viewModels/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key, required this.productId, required this.title});

  final int productId;
  final String title;

  @override
  Widget build(BuildContext context) {
    final productsViewModel = context.read<ProductDetailViewModel>();
    productsViewModel.getProductDetail(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<ProductDetailViewModel>(
        builder: (context, productDetail, _) {
          return productDetail.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: productDetail.productDetail.images
                            .map((image) => FadeInImage.assetNetwork(
                                  image: image,
                                  placeholder: "assets/images/loading.gif",
                                  width: 80,
                                  height: 100,
                                  fit: BoxFit.contain,
                                  placeholderErrorBuilder:
                                      (context, error, stackTrace) {
                                    return const SizedBox(
                                      width: 120,
                                      height: 150,
                                    );
                                  },
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return const SizedBox(
                                      width: 120,
                                      height: 150,
                                    );
                                  },
                                ))
                            .toList(),
                      ),
                      Text(productDetail.productDetail.description),
                      const SizedBox(height: 15),
                      Text(
                        NumberFormat.currency(symbol: "USD", decimalDigits: 2)
                            .format(productDetail.productDetail.price),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            onPressed: () {},
                            text: "Agregar al carrito",
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
