import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';
import 'package:provider_crud_app/todo_app_sharepreference/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app_sharepreference/provider/themeProvider.dart';
import 'package:provider_crud_app/todo_app_sharepreference/view/todo_home%20_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'chanting_app/provider/counter_provider.dart';
import 'gallery_authentication/view/home/gallery_homePage.dart';

bool currenttheme = false;
late TodoProvider todoProvider;
late ThemeProvider themeProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  todoProvider=TodoProvider();
  await todoProvider.refreshToDoList();
  themeProvider = ThemeProvider();
  await themeProvider.getTheme();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GalleryHome_Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => todoProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider,
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: Provider.of<ThemeProvider>(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => Todo_App(),
        },
      ),
    );
  }
}
