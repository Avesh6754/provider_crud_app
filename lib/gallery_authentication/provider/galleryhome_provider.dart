import 'package:flutter/material.dart';
import 'package:provider_crud_app/gallery_authentication/modal/modal_class.dart';
import 'package:provider_crud_app/gallery_authentication/utils/global.dart';

class GalleryHome_Provider extends ChangeNotifier{

  List<GalleryHome> galleryimage=[];

  GalleryHome_Provider()
  {
    galleryimage=albums.map((e) => GalleryHome.fromMap(e),).toList();
  }
}