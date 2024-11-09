import 'package:flutter/material.dart';
import 'package:provider_crud_app/theme_profile/views/component/rowitems.dart';

import '../../utils/global.dart';

class RowList extends StatelessWidget {
  const RowList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.surface,
      Theme.of(context).colorScheme.onPrimary,
      Theme.of(context).colorScheme.primary,
    ];
    return Column(
      children: [
        ...List.generate(
            profilelist.length,
            (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  child: RowItems(
                    color: colors[index],
                    iconData: profilelist[index].iconData,
                    name: profilelist[index].name,
                  ),
                ))
      ],
    );
  }
}
