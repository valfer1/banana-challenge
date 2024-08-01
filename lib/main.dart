import 'package:banana_challenge/root.dart';
import 'package:banana_challenge/viewModels/auth_view_model.dart';
import 'package:banana_challenge/viewModels/product_detail_view_model.dart';
import 'package:banana_challenge/viewModels/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider<ProductsViewModel>(
          create: (context) => ProductsViewModel(),
        ),
        ChangeNotifierProvider<ProductDetailViewModel>(
          create: (context) => ProductDetailViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme.light()
              .copyWith(primary: const Color(0xff9e007e)),
          useMaterial3: true,
        ),
        home: const RootPage(),
      ),
    );
  }
}
