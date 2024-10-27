import 'package:flutter/material.dart';

class emptylist extends StatelessWidget {
  const emptylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.ads_click_outlined,
            size: 150,
            color: Colors.black12,
          ),
          Text(
            'You have not completed anything',
            style: TextStyle(
                fontWeight: FontWeight.w600, letterSpacing: 1, fontSize: 20),
          ),
          Text(
            'Complete some tasks to shift some over here.',
            style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}