import 'package:flutter/material.dart';


class TodoModal{
  late String description,task;
  late String dateTime;
  late bool isCompleted;

  // late bool isCheck;

  TodoModal({required this.description,required this.isCompleted,required this.dateTime,required this.task});
}