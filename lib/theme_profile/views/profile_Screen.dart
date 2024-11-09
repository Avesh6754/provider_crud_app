import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/theme_profile/provider/profile_provider.dart';
import 'package:provider_crud_app/theme_profile/utils/global.dart';

import '../modal/modal.dart';
import 'component/profileImage.dart';
import 'component/rowList.dart';
import 'component/rowswitch.dart';
import 'component/rowswitch.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileProvider providertrue =
        Provider.of<ProfileProvider>(context, listen: true);
    ProfileProvider providerfalse =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:Icon(
          Icons.arrow_back_ios_rounded,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileImage(),
          RowSwitch(providertrue: providertrue, providerfalse: providerfalse),
          RowList()
        ],
      ),
    );
  }
}






