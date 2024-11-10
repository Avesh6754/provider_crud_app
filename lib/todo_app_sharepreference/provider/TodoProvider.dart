import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_crud_app/todo_app_sharepreference/provider/localTodoShave.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/modal.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModal> todolist = [];

  LocalTodo localTodo=LocalTodo();

  void addtodo({required String task,
      required String description,
      required DateTime datetime}) {
    String formatted = DateFormat('hh:mm a').format(datetime);
    todolist.add(TodoModal(
      dateTime: formatted,
      description: description,
      isCompleted: false,
      task:task

    ));
localTodo.setdata(todolist);

    notifyListeners();
  }
  void markAsComplete(int index){
    todolist[index].isCompleted = !todolist[index].isCompleted;
    localTodo.setdata(todolist);
    notifyListeners();
  }

  void removetodo(int index) {
    todolist.removeAt(index);
    localTodo.setdata(todolist);
    notifyListeners();
  }

  void updatetodo( {required String task,
  required String description,
  required DateTime datetime,required int index}) {
    String formatted = DateFormat('hh:mm a').format(datetime);
    todolist[index].task = task;
    todolist[index].description = description;
    todolist[index].dateTime = formatted;
    localTodo.setdata(todolist);
    notifyListeners();
  }
  Future<void> refreshToDoList() async {
    todolist = await localTodo.get();
    notifyListeners();
  }

}
