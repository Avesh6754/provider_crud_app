import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    final LocalAuthentication auth = LocalAuthentication();
    bool canAut = await auth.canCheckBiometrics && await auth.isDeviceSupported();

    if(canAut){
      await auth.authenticate(localizedReason: "Verify to open hidden album");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Hiddenscreen(),));
    } else {
      log('Warning: Authentication issue!');
    }
    notifyListeners();
}
}