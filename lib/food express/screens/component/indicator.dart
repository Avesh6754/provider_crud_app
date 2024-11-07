import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/list_update_provider.dart';

class Indicatorcolor extends StatelessWidget {
  const Indicatorcolor({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (Provider.of<ListUpdateProvider>(context, listen: true)
          .currentindex ==
          index)
          ? 13
          : 10,
      width: (Provider.of<ListUpdateProvider>(context, listen: true)
          .currentindex ==
          index)
          ? 13
          : 10,
      margin: EdgeInsets.only(right: 10, bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (Provider.of<ListUpdateProvider>(context, listen: true)
              .currentindex ==
              index)
              ? Colors.orange
              : Colors.grey),
    );
  }
}