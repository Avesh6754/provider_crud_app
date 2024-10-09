import 'package:flutter/material.dart';

class Background{
  late String name,banner;
  late List<String> img;
  Background({required this.name,required this.banner,required this.img});

  factory Background.fromMap(Map m1)
  {
    return Background(name: m1['Name'], banner: m1['banner'], img: List.from(m1['image']));
  }

}