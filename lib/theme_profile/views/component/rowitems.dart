import 'package:flutter/material.dart';

class RowItems extends StatelessWidget {
  const RowItems({
    super.key,
    required this.iconData,
    required this.color,
    required this.name,
  });
final Color color;
final IconData iconData;
final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
        ),
        const SizedBox(
          width: 26,
        ),
        Text(
          '${name}',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}