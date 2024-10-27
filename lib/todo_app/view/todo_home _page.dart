import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/utils/global.dart';
import 'package:provider_crud_app/todo_app/view/component/datetime.dart';

import 'component/alertdialodbox.adrt.dart';
import 'component/completedtask.dart';
import 'component/pendingtask.dart';
import 'component/profile.dart';

class Todo_App extends StatelessWidget {
  const Todo_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profiledata(),
              const SizedBox(
                height: 20,
              ),
              DateTimeClass(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                alignment: Alignment.center,
                child: const Row(
                  children: [PendingTask(), Completedtask()],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ...List.generate(
                Provider.of<TodoProvider>(context, listen: true)
                    .taskList
                    .length,
                (index) => ListTile(
                  title: Text(
                      '${Provider.of(context, listen: true).taskList[index]}'),
                  subtitle: Text(
                      '${Provider.of(context, listen: true).descriptionList[index]}'),
                  trailing: Text(
                      '${Provider.of(context, listen: true).datetime[index]}'),
                  leading: Checkbox(
                    value: bool.parse(
                        Provider.of(context, listen: true).status[index]),
                    onChanged: (v) {
                      Provider.of(context, listen: false)
                          .updatestatus(v!, index);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialodbox(),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}


