import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../provider/counter_provider.dart';
class Counter_Container extends StatelessWidget {
  const Counter_Container({
    super.key,
    required this.counterProviderfalse,
    required this.counterProvidertrue,
  });

  final CounterProvider counterProviderfalse;
  final CounterProvider counterProvidertrue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black.withOpacity(0.55),
                child: CupertinoButton(
                  onPressed: () {
                    counterProviderfalse.incrementcounter();
                    counterProviderfalse.counterround();
                    counterProviderfalse.totalcounting();
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.black.withOpacity(0.58),
                    child: Text(
                      '${counterProvidertrue.counter}',
                      style:
                      TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}