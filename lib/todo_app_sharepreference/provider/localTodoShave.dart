
import 'package:flutter/material.dart';
import 'package:provider_crud_app/todo_app_sharepreference/modal/modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoLocalProvider {
  List<String> title = [];
  List<String> description = [];
  List<String> time = [];
  List<String> isComplete = [];


  //saveLists
  Future<void> setLists(List<TodoModal> todoList) async {
    title.clear();
    description.clear();
    time.clear();
    isComplete.clear();


    for (int i = 0; i < todoList.length; i++) {
      title.add(todoList[i].task);
      description.add(todoList[i].description);
      time.add(todoList[i].dateTime);
      isComplete.add(todoList[i].isCompleted.toString());
    }



    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('title', title);
    await preferences.setStringList('description', description);
    await preferences.setStringList('time', time);
    await preferences.setStringList('isComplete', isComplete);


  }

  Future<List<TodoModal>> getLists() async {
    List<TodoModal> list = [];

    SharedPreferences preferences = await SharedPreferences.getInstance();
    title = preferences.getStringList('title') ?? [];
    description = preferences.getStringList('description') ?? [];
    time = preferences.getStringList('time') ?? [];
    isComplete = preferences.getStringList('isComplete') ?? [];


    for (int i = 0; i < title.length; i++) {
      list.add(TodoModal(
        task:  title[i],
        description: description[i],
        dateTime:time[i],
        isCompleted: bool.parse(isComplete[i]),
      ));
    }

    return list;
  }

}
