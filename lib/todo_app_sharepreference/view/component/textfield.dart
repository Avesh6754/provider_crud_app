import 'package:flutter/material.dart';

import '../../utils/global.dart';


class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.name,
    required this.label,
  });
final TextEditingController name;
final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:name,
      maxLines: 2,
      decoration: InputDecoration(
        label:  Text('$label'),

      ),
    );
  }
}