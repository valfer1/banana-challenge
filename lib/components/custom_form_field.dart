import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    this.isObscure = false,
    required this.hint,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final bool isObscure;
  final String hint;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isObscure,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
          ),
          onChanged: onChanged),
    );
  }
}
