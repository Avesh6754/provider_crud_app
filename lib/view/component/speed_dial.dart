import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../provider/counter_provider.dart';


class FloatingAction extends StatelessWidget {
  const FloatingAction({
    super.key,
    required this.counterProviderfalse,
  });

  final CounterProvider counterProviderfalse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CupertinoButton(
          onPressed: () {
            counterProviderfalse.decrementcounter();
          },
          child: Container(
            decoration: const BoxDecoration(

                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1.0,
                      blurRadius: 3,
                      offset: Offset(1, 3)
                  )
                ]
            ),
            child: const CircleAvatar(
              radius: 29,
              child: Icon(Icons.remove_circle_outline,),
            ),
          ),
        ),
        SizedBox(width: 5,),
        SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 12,
          spaceBetweenChildren: 10,
          children: [
            SpeedDialChild(
              onTap: () {
                counterProviderfalse.restartcounter();
              },
              child: Icon(Icons.restart_alt),
              label: 'Restart',
            ),
            SpeedDialChild(
              onTap: () {},
              child: Icon(Icons.save),
              label: 'Save',
            ),
            SpeedDialChild(
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
              child: Icon(Icons.image),
              label: 'Background Image',
            )
          ],
        ),
      ],
    );
  }
}