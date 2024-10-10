import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/counter_provider.dart';
import 'package:provider_crud_app/provider/home_provider.dart';
import 'package:provider_crud_app/view/counter_page.dart';
import 'package:provider_crud_app/view/home_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => BackgroundProvider(),),
      ],

      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>CounterPage(),
          '/home':(context)=>HomePage(),
        },
      ),
    );
  }
}
