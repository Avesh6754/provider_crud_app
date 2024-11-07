import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';
import 'package:provider_crud_app/gallery_authentication/view/hiddenScreen/hiddenScreen.dart';

import '../../utils/global.dart';

class PopUpMenuIteambutton extends StatelessWidget {
  const PopUpMenuIteambutton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.more_vert),
      onSelected: (Menu item) async {
        if (item == Menu.hidden) {

          await Provider.of<GalleryHome_Provider>(context, listen: false).authenticationuser(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Hiddenscreen(),
          //     ));
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: Menu.share,
          child: ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
        ),
        const PopupMenuItem(
          value: Menu.hidden,
          child: ListTile(
            leading: Icon(Icons.hide_image_outlined),
            title: Text('Hide'),
          ),
        ),
        const PopupMenuItem(
          value: Menu.delete,
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        )
      ],
    );
  }
}
