

import 'package:flutter/material.dart';
class HorizontalTextInputBox extends StatelessWidget {
  const HorizontalTextInputBox({
    super.key,
    this.textInputType,
    required this.hintText,
    this.max,
  });

  final TextInputType? textInputType;
  final String hintText;
  final int? max;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      maxLines: max??1,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border:OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width:1,
          ),
        ),
      ),
    );
  }
}