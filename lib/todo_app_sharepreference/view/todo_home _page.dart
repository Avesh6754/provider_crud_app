import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/TodoProvider.dart';
import '../provider/themeProvider.dart';
import 'component/button_add.dart';
import 'component/button_update.dart';
import 'component/task_add.dart';
import 'component/textfield.dart';
import 'component/updatetask.dart';

class Todo_App extends StatelessWidget {
  const Todo_App({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TodoProvider providertrue =
        Provider.of<TodoProvider>(context, listen: true);
    TodoProvider providerfalse =
        Provider.of<TodoProvider>(context, listen: false);

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    ThemeProvider themeProviderfales =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TODO App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Switch(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProviderfales.themeChange();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            ...List.generate(
              providertrue.todolist.length,
              (index) => Card(
                child: ListTile(
                  leading:  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      providerfalse.markAsComplete(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 24,
                        child: Icon(
                          providertrue.todolist[index].isCompleted ? Icons.done : Icons.radio_button_off,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  title:
                      Text('${index + 1} ${providertrue.todolist[index].task}'),
                  subtitle: Text(
                      '${providertrue.todolist[index].description}\n${providertrue.todolist[index].dateTime}'),
                  trailing: UpdateButton(
                    providertrue: providertrue,
                    formkey: formkey,
                    providerfalse: providerfalse,
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          Add_Button(formkey: formkey, providerfalse: providerfalse),
    );
  }
}
