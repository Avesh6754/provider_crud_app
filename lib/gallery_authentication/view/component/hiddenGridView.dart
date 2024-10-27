import 'package:flutter/material.dart';

class HiddenGridView extends StatelessWidget {
  const HiddenGridView({
    super.key,
    required this.length,
    required this.folder,
  });
final int length;
final String folder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: length,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            childAspectRatio: 0.4,
            mainAxisExtent: 80,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 5), itemBuilder: (context, index) =>Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/image/$folder/image${index + 1}.jpeg'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    ));
  }
}