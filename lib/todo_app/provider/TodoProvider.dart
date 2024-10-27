import 'package:flutter/material.dart';
class TodoProvider extends ChangeNotifier{
  bool iscompleted=false;
  void taskStatus(bool value)
  {
    iscompleted=value;
    notifyListeners();
  }
}