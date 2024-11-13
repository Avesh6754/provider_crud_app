import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/todo_app_sharepreference/utils/global.dart';


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
    TodoProviderShare providertrue =
        Provider.of<TodoProviderShare>(context, listen: true);
    TodoProviderShare providerfalse =
        Provider.of<TodoProviderShare>(context, listen: false);

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    ThemeProvider themeProviderfales =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
       elevation: 5,
        shadowColor: Colors.black38,
        title: const Text(
          'TODO App',
          style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1),
        ),
        actions: [
          GFToggle(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProviderfales.themeChange();
            },
            disabledThumbColor: Colors.purple,
            enabledTrackColor:Colors.red,
            enabledThumbColor: Theme.of(context).colorScheme.primary,
            type: GFToggleType.custom,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Text('Today Task',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
            ),
            const SizedBox(
              height: 5,
            ),
            ...List.generate(
              providertrue.todolist.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(vertical: BorderSide(color: color[index],width: 6))
                          ,borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      leading: Checkbox(value:providertrue.todolist[index].isCompleted , onChanged: (value) {
                        providerfalse.markAsComplete(index);
                      },),
                      title:
                          Text('${providertrue.todolist[index].task}'),
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
