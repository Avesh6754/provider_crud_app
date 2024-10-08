import 'package:flutter/material.dart';
import 'package:provider_crud_app/modal/modalclass.dart';

import '../utils/global.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController? txtname;
  TextEditingController? txtid;
  DateTime? dateTimenoe;

  List<Student> studentdata = [];

  void addstudent(String name,String id) {
    studentdata.add(
        Student(name: name, id: id, dateTime: dateTimenoe!));
    notifyListeners();
  }

  void removestudent() {}

  void updatestudent() {}
}
