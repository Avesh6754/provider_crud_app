import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/global.dart';

class CounterProvider extends ChangeNotifier{
  int counter=0;
  int round=0;
  int totalcount=0;
  int index=0;
  void background_Right_to_left()
  {
    if(index!=backgroundlist.length-1)
    {
      index++;
    }
    else
    {
      index=0;
    }
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void background_Left_to_Right()
  {
    if(index==0)
    {
      index=backgroundlist.length-1;
    }
    else
    {
      index--;
    }
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void incrementcounter()
  {
    counter++;

   if(counter>108)
     {
       counter=1;
     }
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void totalcounting()
  {
    totalcount++;
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void decrementcounter()
  {
    if(counter>0)
      {
        totalcount--;
        counter--;
      }
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void restartcounter()
  {

      counter=0;
      saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }
  void counterround()
  {
    if(counter>=108)
      {
        round++;
      }
    saveappdata(counter, totalcount, round, index);
    notifyListeners();
  }




  Future<void> saveappdata(int count,int total,int totalround,int value)
  async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
   bool status= await sharedPreferences.setInt('count', count);
     await sharedPreferences.setInt('total', total);
    await sharedPreferences.setInt('round', totalround);
    await sharedPreferences.setInt('index', value);
    if(status)
      {
        log('Data Save :$count');
      }
  }
  Future<void> getData()
  async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   counter= sharedPreferences.getInt('count')??0;
   //??null replacement operator if the value null to assign 0;
   totalcount= sharedPreferences.getInt('total')??0;
   round= sharedPreferences.getInt('round')??0;
   index= sharedPreferences.getInt('index')??0;
   notifyListeners();
  }
  Future<void> imagesave()
  async {
    RenderRepaintBoundary boundary = imagekey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData =
    await image.toByteData(format: ImageByteFormat.png);
    log(byteData.hashCode.toString());
    if (byteData != null) {
      final uint8List = byteData.buffer.asUint8List();
      log(uint8List.toString());
      await ImageGallerySaver.saveImage(uint8List);
    }
  }

  CounterProvider()
  {
    getData();
  }
}