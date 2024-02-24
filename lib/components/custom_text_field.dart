import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.textEditingController, required this.hint});

  final TextEditingController textEditingController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration:
          InputDecoration(hintText: hint, border: const OutlineInputBorder()),
    );
  }
}
