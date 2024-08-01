import 'package:banana_challenge/components/custom_form_field.dart';
import 'package:banana_challenge/components/product_card.dart';
import 'package:banana_challenge/viewModels/auth_view_model.dart';
import 'package:banana_challenge/viewModels/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final authViewModel = context.read<AuthViewModel>();
    final productsViewModel = context.read<ProductsViewModel>();

    productsViewModel.getProducts();

    List<Widget> buildProducts(List products) {
      return productsViewModel.products
          .map((product) => ProductCard(product: product))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Flutter challenge 2023",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.logout_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            authViewModel.logout();
          },
        ),
      ),
      body: Consumer<ProductsViewModel>(
        builder: (context, productsViewModel, _) {
          return productsViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: CustomFormField(
                              controller: searchController,
                              hint: "Buscar productos",
                              onChanged: (value) {
                                if (value == "") {
                                  productsViewModel.getProducts();
                                }
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              productsViewModel
                                  .searchProducts(searchController.text);
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      productsViewModel.products.isEmpty
                          ? Text(
                              "No se encontraron resultados para ${searchController.text}")
                          : Column(
                              children:
                                  buildProducts(productsViewModel.products)),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
