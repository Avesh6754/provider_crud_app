import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_crud_app/modal/modalclass.dart';

import '../utils/global.dart';

class HomeProvider extends ChangeNotifier {


  List<Student> studentdata = [];

  void addstudent(String id,String name,DateTime datetime) {
    String formatted = DateFormat('hh:mm a').format(datetime);
    studentdata.add(Student(name: name, id: id, dateTime: formatted));

    notifyListeners();
  }

  void removestudent(int index) {
    studentdata.removeAt(index);
    notifyListeners();
  }

  void updatestudent(String id,String name,DateTime datetime,int index) {
    String formatted = DateFormat('hh:mm a').format(datetime);
    studentdata[index].id=id;
    studentdata[index].name=name;
    studentdata[index].dateTime=formatted;
    notifyListeners();
  }
}
