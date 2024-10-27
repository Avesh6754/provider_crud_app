import 'package:flutter/material.dart';
import 'package:provider_crud_app/food%20express/modal/modal.dart';

import 'package:provider_crud_app/food%20express/utils/list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListUpdateProvider extends ChangeNotifier {
  int currentindex = 0;
  bool isHome = false;

  List<Onboardingclass> onboardindlist=[];

  void listUpdate(int value) {
  currentindex=value;
    notifyListeners();
  }

  void lastPage() {
    isHome = true;
    notifyListeners();
  }

  Future<void> setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isHome', isHome);
  }

  Future<void> getData()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isHome = preferences.getBool('isHome') ?? false;
  }

  ListUpdateProvider() {

    onboardindlist=screensList.map((e) => Onboardingclass.fomMap(e)).toList();

    getData();
  }
}
