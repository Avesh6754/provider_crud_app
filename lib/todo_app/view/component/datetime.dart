import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/global.dart';

class DateTimeClass extends StatelessWidget {
  const DateTimeClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Today, ${DateFormat('d/M, E').format(datetime)}',
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 0.5),
    );
  }
}
