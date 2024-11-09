import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 120,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/image/15.jpg'),fit: BoxFit.cover)
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Avesh Kumar',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 60,
        ),

      ],
    );
  }
}