import 'package:banana_challenge/models/product_model.dart';
import 'package:banana_challenge/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ProductDetail(productId: product.id, title: product.title),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInImage.assetNetwork(
                    image: product.thumbnail,
                    placeholder: "assets/images/loading.gif",
                    height: 100,
                    fit: BoxFit.contain,
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 120,
                        height: 150,
                      );
                    },
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 120,
                        height: 150,
                      );
                    },
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.title,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          product.brand ?? "",
                          textAlign: TextAlign.right,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(NumberFormat.currency(
                                symbol: 'USD', decimalDigits: 2)
                            .format(product.price)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
