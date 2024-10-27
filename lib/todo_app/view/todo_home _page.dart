import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/utils/global.dart';

import '../provider/themeProvider.dart';


class Todo_App extends StatelessWidget {
  const Todo_App({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TodoProvider providertrue =
    Provider.of<TodoProvider>(context, listen: true);
    TodoProvider providerfalse =
    Provider.of<TodoProvider>(context, listen: false);

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context,listen: true);
    ThemeProvider themeProviderfales=Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'TODO App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Switch(value:themeProvider.isDark , onChanged: (value) {
            themeProviderfales.themeChange();
          },)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            ...List.generate(
              providertrue.studentdata.length,
                  (index) => Card(
                child: ListTile(
                  leading:
                  CircleAvatar(radius: 20, child: Text('${index + 1}')),
                  title: Text('${providertrue.studentdata[index].name}'),
                  subtitle: Text(
                      '${providertrue.studentdata[index].id}\n${providertrue.studentdata[index].dateTime}'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              txtid.text = providertrue.studentdata[index].id;
                              txtname.text =
                                  providertrue.studentdata[index].name;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Form(
                                      key: formkey,
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Update Task',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: txtname,
                                            decoration: InputDecoration(
                                              label: Text('Task'),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextField(
                                            controller: txtid,
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                              label: const Text('Description'),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            Navigator.of(context).pop();
                                            providerfalse.updatestudent(
                                                txtid!.text,
                                                txtname!.text,
                                                DateTime.now(),
                                                index);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text('Update Save'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text('Save'))
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              providerfalse.removestudent(index);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txtname=TextEditingController();
          txtid=TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(2),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text('Add Task'),
                      TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "This deatils is mandatory"
                              : null;
                        },
                        controller: txtname,
                        decoration: InputDecoration(
                            label: Text('Task'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          return value!.isEmpty
                              ? "This deatils is mandatory"
                              : null;
                        },
                        controller: txtid,
                        maxLines: 2,
                        decoration: InputDecoration(
                          label: Text('Description'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        providerfalse.addstudent(
                          txtid!.text,
                          txtname!.text,
                          DateTime.now(),
                        );

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Task Save'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: Text('Save'))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


