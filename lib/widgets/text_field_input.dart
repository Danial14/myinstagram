import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPass;
  final TextInputType inputType;
  const TextFieldInput({super.key,
  required this.inputType,
    required this.isPass,
    required this.textEditingController,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8)
      ),
      keyboardType: inputType,
      obscureText: isPass,
    );
  }
}
