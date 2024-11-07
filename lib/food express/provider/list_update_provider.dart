import 'package:flutter/material.dart';
import 'package:provider_crud_app/food%20express/modal/modal.dart';

import 'package:provider_crud_app/food%20express/utils/list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListUpdateProvider extends ChangeNotifier {
  int currentindex = 0;
  bool isHome = false;


  void listUpdate(int value) {
  currentindex=value;
    notifyListeners();
  }


  Future<void> setData(bool isHome) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isHome',isHome);

  }
  void lastPage()
  {
    isHome = true;
    setData(isHome);
    notifyListeners();
  }


  ListUpdateProvider(bool isHometemp) {
isHome=isHometemp;



  }
}
