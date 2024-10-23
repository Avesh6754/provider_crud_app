import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/gallery_authentication/provider/galleryhome_provider.dart';



import 'chanting_app/provider/counter_provider.dart';
import 'gallery_authentication/view/home/gallery_homePage.dart';


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
        ChangeNotifierProvider(create: (context) => GalleryHome_Provider(),),
      ],

      builder: (context, child) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>GalleryHomepage(),
        },
      ),
    );
  }
}
