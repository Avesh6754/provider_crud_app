import 'package:flutter/material.dart';
class TextHiddesection extends StatelessWidget {
  const TextHiddesection({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        const Text('Select',style: TextStyle(fontWeight: FontWeight.w500
            ,fontSize: 20,color: Colors.blue),),
      ],
    );
  }
}