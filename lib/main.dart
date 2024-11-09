import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';
import 'package:provider_crud_app/stepper_widget/provider/stepper_Provider.dart';
import 'package:provider_crud_app/stepper_widget/views/Stepper_Vertical.dart';
import 'package:provider_crud_app/stepper_widget/views/home/stepper_Screen.dart';
import 'package:provider_crud_app/theme_profile/provider/profile_provider.dart';
import 'package:provider_crud_app/theme_profile/provider/theme_provider.dart';
import 'package:provider_crud_app/theme_profile/views/profile_Screen.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/provider/themeProvider.dart';
import 'package:provider_crud_app/todo_app/view/todo_home%20_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'chanting_app/provider/counter_provider.dart';
import 'gallery_authentication/view/home/gallery_homePage.dart';

bool currenttheme=false;
Future<void> main()
 async {
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences preferences = await SharedPreferences.getInstance();
   currenttheme = preferences.getBool('isDark') ?? false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => GalleryHome_Provider(),),
        ChangeNotifierProvider(create: (context) => TodoProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileProvider(currenttheme),),

        ChangeNotifierProvider(create: (context) => Stepper_Provider(),)
      ],

      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ProfileThemeProvider.lightTheme,
        darkTheme: ProfileThemeProvider.darkTheme,
        themeMode:Provider.of<ProfileProvider>(context).isDark?ThemeMode.dark:ThemeMode.light,
        routes: {
          '/':(context)=>ProfileScreen(),
        },
      ),
    );
  }
}
