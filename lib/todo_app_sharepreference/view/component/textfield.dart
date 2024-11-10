import 'package:flutter/material.dart';

import '../../utils/global.dart';


class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.name,
  });
final TextEditingController name;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:name,
      maxLines: 2,
      decoration: InputDecoration(
        label: const Text('Description'),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.blue,
              width: 2),
        ),
      ),
    );
  }
}