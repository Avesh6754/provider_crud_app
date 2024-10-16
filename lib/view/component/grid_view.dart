import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../provider/home_provider.dart';
class GridViewData extends StatelessWidget {
  const GridViewData({
    super.key,
    required this.providertrue,
    required this.providerfalse,

  });

  final BackgroundProvider providertrue;
  final BackgroundProvider providerfalse;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate:
       const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: providertrue.background.length,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(7),
          child: GestureDetector(
            onTap: () {
              providerfalse.selectedimage(index);
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white,width: 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white54,
                        spreadRadius: 0.2,
                        blurRadius: 0.5
                    )
                  ]
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),

                  child: Image.asset(providertrue.background[index])),
            ),
          )),
    );
  }
}