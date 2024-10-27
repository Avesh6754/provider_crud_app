import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider_crud_app/gallery_authentication/modal/modal_class.dart';
import 'package:provider_crud_app/gallery_authentication/utils/global.dart';
import 'package:provider_crud_app/gallery_authentication/view/hiddenScreen/hiddenScreen.dart';

class GalleryHome_Provider extends ChangeNotifier{

  List<GalleryHome> galleryimage=[];

  GalleryHome_Provider()
  {
    galleryimage=albums.map((e) => GalleryHome.fromMap(e),).toList();
  }

  Future<void> authenticationuser(BuildContext context)
  async {
    LocalAuthentication authentication=LocalAuthentication();
    bool canAuthentication= await authentication.canCheckBiometrics && await authentication.isDeviceSupported();
    if(canAuthentication)
      {
         await authentication.authenticate(localizedReason: 'To Open Gallery , first verify password ');
         Navigator.push(context, MaterialPageRoute(builder: (context) => Hiddenscreen(),));
         notifyListeners();
      }
    else
      {
        log('Warning: Authentication issue!');
      }

  }
}