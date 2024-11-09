import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier{

  bool isDark=false;
  void toggle(){
    isDark = !isDark;
    saveTheme(isDark);
    notifyListeners();
  }

  // saveTheme
  Future<void> saveTheme(bool value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isDark', value);
  }

  // getThem

  ProfileProvider(bool theme)
  {
    isDark=theme;
  }
}