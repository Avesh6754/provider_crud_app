import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/food%20express/provider/list_update_provider.dart';
import 'package:provider_crud_app/food%20express/screens/home_page.dart';
import 'package:provider_crud_app/food%20express/screens/home_temp_page.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/provider/theme_provider.dart';
import 'package:provider_crud_app/todo_app/view/todo_home%20_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'chanting_app/provider/counter_provider.dart';
import 'gallery_authentication/view/home/gallery_homePage.dart';

bool currenttheme=false;

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isHomtemp = preferences.getBool('isHome') ?? false;

  runApp(MyApp());
}
bool isHomtemp=false;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => GalleryHome_Provider(),),
        ChangeNotifierProvider(create: (context) => ListUpdateProvider(isHomtemp),),
        ChangeNotifierProvider(create: (context) => TodoProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],

      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:Provider.of<ThemeProvider>(context).isDark?ThemeMode.dark:ThemeMode.light,
       home:(Provider.of<ListUpdateProvider>(context).isHome!=true)?HomePage():HomeTempPage(),

      ),
    );
  }
}
