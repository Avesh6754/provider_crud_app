import 'package:flutter/material.dart';

import '../../provider/counter_provider.dart';
class CounterDetails extends StatelessWidget {
  const CounterDetails({
    super.key,
    required this.counterProvidertrue,
  });

  final CounterProvider counterProvidertrue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.78),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            '  Total: ${counterProvidertrue.totalcount}  ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.78),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text('  180 x ${counterProvidertrue.round}  ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ],
    );
  }
}