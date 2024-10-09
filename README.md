# provider_crud_app

# To-Do App

This is a To-Do application built using the Flutter framework and Dart language. It utilizes the Provider state management to perform essential CRUD (Create, Read, Update, Delete) operations. The app allows users to seamlessly manage their tasks, mark them as completed, edit, or delete them as needed. The user interface is intuitive and responsive, ensuring a smooth experience across different devices.

## Features
### Add Tasks:
 Create new tasks to be managed in the to-do list.
### Read Tasks: 
View all the tasks in a categorized list format.
### Update Tasks:
 Edit the task details, including its title and description.
### Delete Tasks: 
Remove completed or unnecessary tasks.
### Mark as Completed:
 Highlight tasks that are completed to keep track of progress.
## Tech Stack

Framework: Flutter

Programming Language: Dart

State Management: Provider

### Code References
```dart
1. Adding a Task
To add a task, we define a function in the Provider class:

dart
Copy code
void addTask(String title, String description) {
  final newTask = Task(title: title, description: description);
  _taskList.add(newTask);
  notifyListeners();
}
```
```dart
2. Reading Tasks
To display the list of tasks, you can use a ListView.builder:

dart
Copy code
@override
Widget build(BuildContext context) {
  return Consumer<TaskProvider>(
    builder: (context, taskProvider, child) {
      return ListView.builder(
        itemCount: taskProvider.taskCount,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
          );
        },
      );
    },
  );
}
```
```dart
3. Updating a Task
Use a method in your Provider to update task properties:

dart
Copy code
void updateTask(int index, String newTitle, String newDescription) {
  _taskList[index].title = newTitle;
  _taskList[index].description = newDescription;
  notifyListeners();
}
```
```dart
4. Deleting a Task
To delete a task, simply use the following method in your Provider:

dart
Copy code
void deleteTask(int index) {
  _taskList.removeAt(index);
  notifyListeners();
}
```

<p>
 

  <img src="https://github.com/user-attachments/assets/d7ca8a25-1dd8-4726-bf49-b496f467e5e9" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/5ed338be-243c-4d78-8a5b-7e4228e435a3" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/3a29cca3-7a3d-4b7f-9921-2078d4fa01ad" width="22%" Height="35%">
</p>



https://github.com/user-attachments/assets/f5a9430b-9a47-4dcc-b999-035dcd48ace5

