import 'package:flutter/material.dart';

class GalleryHome{
  
  String? name;
  int? length;
  String? image;
  
  GalleryHome({required this.length,required this.name,required this.image});
  
  factory GalleryHome.fromMap(Map m1)
  {
    return GalleryHome(length: m1['length'], name: m1['name'], image: m1['image']);
  }
}