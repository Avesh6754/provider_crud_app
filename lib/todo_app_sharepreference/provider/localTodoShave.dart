import 'package:provider_crud_app/todo_app_sharepreference/modal/modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalTodo {
  List<String> task = [];
  List<String> description = [];
  List<String> datetime = [];
  List<String> isComplete = [];

  Future<void> setdata(List<TodoModal> todolist) async {
    task.clear();
    description.clear();
    datetime.clear();
    isComplete.clear();

    for (int i = 0; i < todolist.length; i++) {
      task.add(todolist[i].task);
      description.add(todolist[i].description);
      datetime.add(todolist[i].dateTime);
      isComplete.add(todolist[i].isCompleted as String);
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('task', task);
    await sharedPreferences.setStringList('des', description);
    await sharedPreferences.setStringList('date', datetime);
    await sharedPreferences.setStringList('check', isComplete);
  }

  Future<List<TodoModal>> get() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<TodoModal> newtodoList = [];

    task = sharedPreferences.getStringList('task') ?? task;
    description = sharedPreferences.getStringList('des') ?? description;
    datetime = sharedPreferences.getStringList('date') ?? datetime;
    isComplete = sharedPreferences.getStringList('check') ?? isComplete;

    for (int i = 0; i < newtodoList.length; i++) {
      newtodoList.add(TodoModal(
          description: description[i],
          isCompleted: bool.parse(isComplete[i]),
          dateTime: datetime[i],
          task: task[i]));
    }
    return newtodoList;
  }
}
