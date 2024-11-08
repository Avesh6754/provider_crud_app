
import 'package:flutter/material.dart';
class TextInputBox extends StatelessWidget {
  const TextInputBox({
    super.key,
    this.textInputType,
    required this.hintText,
  });

  final TextInputType? textInputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width:2,
          ),
        ),
      ),
    );
  }
}