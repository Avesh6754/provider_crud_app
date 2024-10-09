import 'package:flutter/material.dart';
import 'package:provider_crud_app/modal/modal_class.dart';
import 'package:provider_crud_app/modal/modal_list.dart';

class BackgroundProvider extends ChangeNotifier
{
  List<Background> backgroundlist=[];

  void homebackground()
  {
    backgroundlist=backgroundimage.map((e)=>Background.fromMap(e)).toList();
  }

}