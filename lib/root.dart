import 'package:banana_challenge/screens/home.dart';
import 'package:banana_challenge/screens/login.dart';
import 'package:banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, _) {
        authViewModel.checkToken();

        if (authViewModel.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return authViewModel.isLoggedIn ? const HomePage() : const Login();
        }
      },
    );
  }
}
