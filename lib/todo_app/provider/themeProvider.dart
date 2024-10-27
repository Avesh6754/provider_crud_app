import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier
{
  bool isDark=false;
  void themeChange()
  {
    isDark=!isDark;
    notifyListeners();
  }
}