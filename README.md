

<h1 align="center">🔶🔸To-Do App🔸🔶</h1>

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
 

  <img src="https://github.com/user-attachments/assets/9b3d1567-2236-43f0-ac25-c331effde875" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/3aa7e0e4-bbc6-4647-9c1c-b450218a3ac9" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/6d06267b-88af-4878-834e-78bf2b2a02e9" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/1f19edbf-2eaf-4363-92c3-6d7136a0fee4" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/e5e97814-7844-4131-8b80-8c75b3f240c9" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/997e0801-cb78-4e4c-bc15-85ca71c1e5b7" width="22%" Height="35%">
      <img src="https://github.com/user-attachments/assets/6d409537-f084-4c3f-a988-6671579917a9" width="22%" Height="35%">
    <img src="https://github.com/user-attachments/assets/6f0a6962-4c94-4d62-bcec-7827850c7081" width="22%" Height="35%">
      
</p>



https://github.com/user-attachments/assets/aa05ab7b-d012-4ed2-a48e-54e95f502102


<h1 align="center">🔶🔸Counter App🔸🔶</h1> 

### Counter App

A simple counter app built using Flutter, with state persistence for the count and background color using the **Shared Preferences** and **Provider** packages. This app demonstrates state management, persistence, and theme customization in Flutter.

#### Features
- **Persistent State**: Saves the count and background color across app restarts using Shared Preferences.
- **Provider Integration**: Manages state changes with Provider for efficient updates and separation of concerns.
- **Customizable Background**: Users can change the background color, which is saved and restored.

#### Key Code References

1. **Provider Setup**
   ```dart
   ChangeNotifierProvider(
     create: (_) => CounterProvider(),
     child: MyApp(),
   );
   ```

2. **Shared Preferences for Persistent Storage**
   - Fetching saved data on startup:
     ```dart
     SharedPreferences prefs = await SharedPreferences.getInstance();
     int savedCount = prefs.getInt('count') ?? 0;
     Color savedColor = Color(prefs.getInt('backgroundColor') ?? Colors.white.value);
     ```
   - Saving data when count or color changes:
     ```dart
     prefs.setInt('count', newCount);
     prefs.setInt('backgroundColor', selectedColor.value);
     ```

3. **Provider Class for Counter Logic**
   ```dart
   class CounterProvider extends ChangeNotifier {
     int _count = 0;
     Color _backgroundColor = Colors.white;

     // Getter for count and background color
     int get count => _count;
     Color get backgroundColor => _backgroundColor;

     // Update methods for count and color, with SharedPreferences persistence
     void incrementCount() { ... }
     void changeBackgroundColor(Color color) { ... }
   }
   ```
   <p>

 <img src="https://github.com/user-attachments/assets/679f5c7c-2899-4439-b5c2-2d912abbc347" width="22%" Height="35%">
 
</p>

https://github.com/user-attachments/assets/4c5b8e61-ac82-4943-b96f-966f0efaa826

<h1 align="center">🔶🔸Intro Page With Share Preference🔸🔶</h1>


### Description:

The onboarding screen is typically displayed when the app is opened for the first time or when there’s no saved user preference for skipping it. Using Shared Preferences, we save a boolean value to track whether the user has completed onboarding. When the user completes onboarding, we save this preference and navigate them directly to the home screen on subsequent launches.

### Implementation Steps:

1. **Onboarding Screen**: Create a series of introductory screens with navigation options.
2. **Shared Preferences**: Save the user’s preference for having completed onboarding.
3. **Home Screen**: Display this as the main screen if the user has already completed onboarding.

### Code Reference

#### 1. Set up `SharedPreferences` in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.15
```

#### 2. Main.dart File
```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isOnboarded = prefs.getBool('onboarded') ?? false;
  runApp(MyApp(isOnboarded: isOnboarded));
}

class MyApp extends StatelessWidget {
  final bool isOnboarded;
  
  MyApp({required this.isOnboarded});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isOnboarded ? HomeScreen() : OnboardingScreen(),
    );
  }
}
```

#### 3. Onboarding Screen (onboarding_screen.dart)
```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  Future<void> _completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarded', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the App!'),
            ElevatedButton(
              onPressed: () => _completeOnboarding(context),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
```

<p>
 

  <img src="https://github.com/user-attachments/assets/118ffc8a-93c1-4781-b7de-adc9db6639b2" width="22%" Height="35%">
  
  <img src="https://github.com/user-attachments/assets/b0487aa7-ef01-462b-ad3d-58194314103c" width="22%" Height="35%">
  
  <img src="https://github.com/user-attachments/assets/1083c298-7cbf-4f16-ad00-b50d1edb9129" width="22%" Height="35%">
  
  <img src="https://github.com/user-attachments/assets/d6e1b1c6-4a5e-4926-90d0-b9ed9d9b2e7e" width="22%" Height="35%">
  </p>



https://github.com/user-attachments/assets/6b97b9af-84c6-4907-8507-906ecb4a28ac

<h1 align="center">🔶🔸Stepper Widget🔸🔶</h1>

### Stepper Widget Demo App in Flutter

This app demonstrates the use of the Stepper widget in Flutter, showcasing both vertical and horizontal orientations. The Stepper widget is useful for visualizing a sequence of steps, making it ideal for applications that involve forms, processes, or multi-step tasks.

#### Features
1. **Vertical and Horizontal Stepper**: Toggle between vertical and horizontal orientations of the Stepper widget.
2. **Step Control**: Navigate through steps with `next`, `back`, and `cancel` controls.
3. **State Management**: Manage the active step index for an intuitive user experience.

#### Code Reference

Here's a basic structure of how the Stepper widget can be implemented:

```dart

      body: Stepper(
        type: _isVertical ? StepperType.vertical : StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: _currentStep < 2
            ? () => setState(() => _currentStep += 1)
            : null,
        onStepCancel: _currentStep > 0
            ? () => setState(() => _currentStep -= 1)
            : null,
        steps: [
          Step(
            title: Text('Step 1'),
            content: Text('This is the first step.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('Step 2'),
            content: Text('This is the second step.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text('Step 3'),
            content: Text('This is the final step.'),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
```

1. **Orientation Toggle**: The app bar includes an icon button to switch between vertical and horizontal modes.
2. **Step Navigation**: The `onStepContinue` and `onStepCancel` functions allow users to navigate through the steps.

#### GitHub Repository
To make the code easily accessible, you can upload it to a GitHub repository. This will allow others to view, clone, and use your Stepper widget demo app.

Let me know if you'd like further assistance with setting up the GitHub repository or if you want additional features added to the app description!

# Vertical Stepper Widget


<p>
  <img src="https://github.com/user-attachments/assets/d7bc1f1a-8e68-4b97-abf7-e331ca3a8e46" width="22%" Height="35%">
 <img src="https://github.com/user-attachments/assets/9d10f78d-1d4f-44ce-a0e8-cba3f460184f" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/8b4c3dc6-d6ee-44b8-abfa-9e31868ea05d" width="22%" Height="35%">
  
  </p>
  
# Horizontal Stepper Widget

  <p>
  <img src="https://github.com/user-attachments/assets/6b65703c-605b-4c65-9982-258c252b9e6c" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/4f65317e-d129-468c-a42e-edce11957f04" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/f06912a4-bd07-46db-8da3-8600be620896" width="22%" Height="35%">
  </p>

https://github.com/user-attachments/assets/af63b503-4490-4385-9d89-02a8e620527b

<h1 align="center">🔶🔸Profile Screen🔸🔶</h1
                                      
### Profile Page Demo with Theme Change and Shared Preferences in Flutter

This Flutter app demonstrates a profile page with a theme switcher. The theme selection persists across sessions using Shared Preferences, allowing users to save their theme choice.

#### Main Features
- **Profile Page**: Displays basic profile information.
- **Theme Switching**: Toggle between light and dark themes.
- **Persistent Theme**: User's theme preference is saved using Shared Preferences.

---

### Code Example

#### 1. Setting Up `ThemeProvider` Class

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToPrefs();
    notifyListeners();
  }

  Future<void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}
```

#### 2. Main Entry Point (`main.dart`)

```dart


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: ProfilePage(),
        );
      },
    );
  }
}
```

#### 3. Profile Page with Theme Switch

```dart

      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),

```

---

### Explanation

- **ThemeProvider Class**: Manages theme state and uses Shared Preferences to persist user preference.
- **Main App (`main.dart`)**: Uses `Provider` to supply the theme across the app.
- **Profile Page**: Displays a basic profile with a theme switcher in the app bar.

### Run the App

Ensure you have dependencies added in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  shared_preferences: ^2.0.0
```

This code allows users to change themes on the profile page and saves the preference using Shared Preferences. Perfect for showcasing theme persistence and user settings management.


 <p>
  <img src="https://github.com/user-attachments/assets/1ca8a5f5-8cc6-4bdc-92f1-09dfb745e85e" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/b919df99-2796-45f5-90fc-4c8230cd5093" width="22%" Height="35%">

  </p>


https://github.com/user-attachments/assets/6958a874-9120-4158-aed4-f473102bcadf

<h1 align="center">🔶🔸Todo App With SharePrefernce🔸🔶</h1>

### To-Do App in Flutter with Shared Preferences for Data Persistence

This Flutter To-Do app allows users to add, update, read, and delete tasks. Data is stored locally using the **Shared Preferences** package, ensuring that tasks persist between sessions without requiring a backend.

#### Features
- **Add Task:** Allows users to add new tasks with a title and description.
- **Update Task:** Users can update existing tasks, modifying the title and description.
- **Read Tasks:** Displays all saved tasks, even after closing and reopening the app.
- **Delete Task:** Users can remove tasks individually.
- **Data Persistence:** Utilizes Shared Preferences to store and retrieve task data locally.

#### Key Code Snippets

1. **Importing Necessary Packages**
   ```dart
   import 'package:flutter/material.dart';
   import 'package:shared_preferences/shared_preferences.dart';
   import 'dart:convert'; // For encoding and decoding JSON data
   ```

2. **Saving Data to Shared Preferences**
   ```dart
   Future<void> saveTaskList(List<Map<String, String>> tasks) async {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString('taskList', jsonEncode(tasks)); // Encode list to JSON string
   }
   ```

3. **Loading Data from Shared Preferences**
   ```dart
   Future<List<Map<String, String>>> loadTaskList() async {
     final prefs = await SharedPreferences.getInstance();
     String? tasksString = prefs.getString('taskList');
     if (tasksString != null) {
       return List<Map<String, String>>.from(jsonDecode(tasksString));
     }
     return [];
   }
   ```

4. **Adding a New Task**
   ```dart
   void addTask(String title, String description) async {
     List<Map<String, String>> tasks = await loadTaskList();
     tasks.add({'title': title, 'description': description});
     saveTaskList(tasks);
   }
   ```

5. **Updating an Existing Task**
   ```dart
   void updateTask(int index, String newTitle, String newDescription) async {
     List<Map<String, String>> tasks = await loadTaskList();
     tasks[index] = {'title': newTitle, 'description': newDescription};
     saveTaskList(tasks);
   }
   ```

6. **Deleting a Task**
   ```dart
   void deleteTask(int index) async {
     List<Map<String, String>> tasks = await loadTaskList();
     tasks.removeAt(index);
     saveTaskList(tasks);
   }
   ```

    <p>
  <img src="https://github.com/user-attachments/assets/0dff5208-5ff2-4041-9ae3-02bdafadc466" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/a46ca4fe-9796-4a52-b3c6-d0bb906936b7" width="22%" Height="35%">
   <img src="https://github.com/user-attachments/assets/0b6aa4f1-0647-4d65-8d5a-d6b178383b29" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/9052b855-d3d7-4333-9acd-6f67d9fec4bc" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/19f3e079-f810-4f58-975e-53ef8e65197e" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/8900cfb7-b44d-412d-a54a-50fb2d9251b3" width="22%" Height="35%">


  </p>



https://github.com/user-attachments/assets/d3dc6946-b3db-485b-a4c6-bef87dbdfd91


