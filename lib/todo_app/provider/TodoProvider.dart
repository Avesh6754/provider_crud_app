import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TodoProvider extends ChangeNotifier{
  bool iscompleted=false,isDark=false;

  List<String> taskList=[];
  List<String> descriptionList=[];
  List<String> datetime=[];
  List<String> status=[];
  void taskStatus(bool value)
  {
    iscompleted=value;
    notifyListeners();
  }

  Future<void> updatestatus(bool value,int index)
  async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    status[index]=value.toString();
    notifyListeners();
    sharedPreferences.setStringList('check', status);
  }

  Future<void> setTodo(String task,description,date,statu)
  async {
    taskList.add(task);
    descriptionList.add(description);
    datetime.add(date);
    status.add(statu);
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('task', taskList);
    await sharedPreferences.setStringList('description', descriptionList);
    await sharedPreferences.setStringList('date', datetime);
    await sharedPreferences.setStringList('check', status);
  }

  Future<void> getTodo()
  async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   taskList = sharedPreferences.getStringList('task')??taskList;
    descriptionList=sharedPreferences.getStringList('description')??descriptionList;
   datetime= sharedPreferences.getStringList('date')??datetime;
    status=sharedPreferences.getStringList('check')??status;
    notifyListeners();
  }
  void themechange(bool value)
  {
    isDark=value;
    setTheme(value);
    notifyListeners();
  }

  Future<void> setTheme(bool value)
  async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   await sharedPreferences.setBool('theme', value);
  }
  TodoProvider(bool theme)
  {
    isDark=theme;
    getTodo();
    notifyListeners();
  }

}