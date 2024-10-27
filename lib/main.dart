import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_crud_app/todo_app/provider/home_provider.dart';
import 'package:provider_crud_app/todo_app/provider/theme_provider.dart';
import 'package:provider_crud_app/todo_app/view/homepage.dart';


void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],

      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).isDark)?ThemeMode.dark:ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}