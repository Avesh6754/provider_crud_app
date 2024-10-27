import 'package:flutter/material.dart';
class Profiledata extends StatelessWidget {
  const Profiledata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(
              'assets/image/appimage/2-removebg-preview.png'),
        ),
        const Text(
          'Hello Josh',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Spacer(),
        CircleAvatar(
          radius: 20,
          foregroundColor: Colors.black.withOpacity(0.5),
          child: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}