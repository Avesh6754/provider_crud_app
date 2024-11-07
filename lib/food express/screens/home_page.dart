import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_crud_app/food%20express/screens/home_temp_page.dart';

import '../provider/list_update_provider.dart';
import '../utils/list.dart';
import 'component/image_text_udf.dart';
import 'component/indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    ListUpdateProvider ProviderFalse =
        Provider.of<ListUpdateProvider>(context, listen: false);
    ListUpdateProvider ProviderTrue =
        Provider.of<ListUpdateProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Expanded(
              child: PageView(

                onPageChanged: (value) {
                  ProviderFalse.listUpdate(value);
                },
          children: [
            buildPage(
                height,
                width,
                'assets/image/appimage/intro2.png',
              'Quick Organize',
                'Lorem Ipsum is simply dummy text\nof the printing and typesetting',


                ),
            buildPage(
                height,
                width,
                'assets/image/appimage/5.png',
              'Easy To Share',
                'Lorem Ipsum is simply dummy text\nof the printing and typesetting',

                ),
            buildPage(
                height,
                width,
              'assets/image/appimage/2.png',
                'Simple To Use',
              'Lorem Ipsum is simply dummy text\nof the printing and typesetting',

             )
          ]),
          ),
            (ProviderTrue.currentindex ==
                    2 )
                ? Align(
              alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            right: 30, left: 30, bottom: 30, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange),
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeTempPage(),));
                              ProviderFalse.lastPage();
                              },
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 25),
                            )),
                      ),
                    ),
                )
                :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Indicatorcolor(
                            index: index,
                          )),
                ),
              ),
            ),
    ]
        ),
      ),
    );
  }
}


