import 'dart:developer';
import 'dart:io';
import 'dart:ui';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../provider/counter_provider.dart';
import '../../utils/global.dart';

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
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1.0,
                  blurRadius: 3,
                  offset: Offset(1, 3))
            ]),
            child: const CircleAvatar(
              radius: 29,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          animatedIconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 12,
          spaceBetweenChildren: 10,
          children: [
            SpeedDialChild(
              onTap: () {
                counterProviderfalse.restartcounter();
              },
              child: const Icon(Icons.restart_alt),
              label: 'Restart',
            ),

          ],
        ),
      ],
    );
  }
}
