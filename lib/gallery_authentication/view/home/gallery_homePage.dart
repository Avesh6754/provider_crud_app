import 'package:flutter/material.dart';
import 'package:provider_crud_app/gallery_authentication/utils/global.dart';
import 'package:provider_crud_app/gallery_authentication/view/component/home_image_grid.dart';

import '../component/pop_up_menu_iteam.dart';

class GalleryHomepage extends StatelessWidget {
  const GalleryHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
        leading: Icon(Icons.menu),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center,
                    child: Text(
                      'Albums',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  PopUpMenuIteambutton()
                ],
              ),
            ),
            HomeImageGrid(),
          ],
        ),
      ),
    );
  }
}
