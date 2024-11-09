

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

# Description

This Flutter-based counter app demonstrates how to use the **Shared Preferences** package to store data persistently. The app allows users to increment a counter, with its value saved locally so that it remains consistent even when the app is restarted. Additionally, users can change the background color, which is also stored persistently.

### Key Features

1. **Persistent Counter**: The counter's value is saved using Shared Preferences, ensuring data continuity across sessions.
2. **Background Color Customization**: Users can choose a background color, and the selected color is stored persistently.

### Code Overview

To set up Shared Preferences in the app, include the package in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.0  # Check for the latest version
```

Then, import and use Shared Preferences in your code:

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  Color _bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadBgColor();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  _loadBgColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bgColor = Color(prefs.getInt('bgColor') ?? Colors.white.value);
    });
  }

  _changeBgColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bgColor = color;
      prefs.setInt('bgColor', color.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: $_counter'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment Counter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _changeBgColor(Colors.blue),
              child: Text('Change Background Color'),
            ),
          ],
        ),
      ),
    );
  }
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

Here's a description of your Stepper widget demo app in Flutter, featuring both vertical and horizontal orientations, along with code references for GitHub:

---

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



