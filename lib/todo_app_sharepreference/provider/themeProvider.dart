import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier
{
  bool isDark=false;
  void themeChange()
  {
    isDark=!isDark;
    saveTheme(isDark);
    notifyListeners();
  }
  Future<void> saveTheme(bool value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isDark', value);

  }

  // getTheme
  Future<void> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isDark = preferences.getBool('isDark') ?? false;
    notifyListeners();
  }
}