import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';

import '../../provider/profile_provider.dart';

class RowSwitch extends StatelessWidget {
  const RowSwitch({
    super.key,
    required this.providertrue,
    required this.providerfalse,
  });

  final ProfileProvider providertrue;
  final ProfileProvider providerfalse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          // ICON
          Icon(
            providertrue.isDark ? Icons.nightlight_round : Icons.sunny,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: 26,
          ),

          // TITLE
          Text(
            providertrue.isDark ? 'Dark mode' : 'Light Mode',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          GFToggle(
            value: providertrue.isDark,
            onChanged: (value) {
              providerfalse.toggle();
            },
            disabledThumbColor: Colors.purple,
            enabledTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            enabledThumbColor: Theme.of(context).colorScheme.primary,
            type: GFToggleType.custom,
          )
        ],
      ),
    );
  }
}