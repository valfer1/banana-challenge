import 'package:banana_challenge/components/custom_button.dart';
import 'package:banana_challenge/components/custom_form_field.dart';
import 'package:banana_challenge/viewModels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthViewModel authViewModel = context.read<AuthViewModel>();
    final formKey = GlobalKey<FormState>();

    void validateAndSubmit() async {
      if (formKey.currentState!.validate()) {
        final login = await authViewModel.login(
            userController.text, passwordController.text);
        if (!login) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario o contraseña incorrectos'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/banana_dance.gif",
              width: 100,
            ),
            Text(
              'Bienvenido',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: userController,
                        validator: (value) {
                          if (value == "") {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                        isObscure: false,
                        hint: "Usuario"),
                    CustomFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == "") {
                            return "Este campo es obligatorio";
                          }
                          return null;
                        },
                        isObscure: true,
                        hint: "Contraseña"),
                    CustomButton(
                      onPressed: () => validateAndSubmit(),
                      text: "Ingresar",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
