import 'package:flutter/material.dart';


SizedBox buildPage(
    double height, double width, String img, String title, String description) {
  return SizedBox(
    height: height,
    width: width,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.092),
          child: Image.asset(
            img,
          ),
        ),
        SizedBox(height: height * 0.060),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: width * 0.0300, letterSpacing: 2),
          ),
        ),
        SizedBox(height: height * 0.04),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: width * 0.0220),
          ),
        ),
      ],
    ),
  );
}