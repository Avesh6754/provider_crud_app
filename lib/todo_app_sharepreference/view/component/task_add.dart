import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/TodoProvider.dart';
import '../../utils/global.dart';

class Task_Add extends StatelessWidget {
  const Task_Add({
    super.key,
    required this.formkey,
    required this.providerfalse,
  });

  final GlobalKey<FormState> formkey;
  final TodoProviderShare providerfalse;

  @override
  Widget build(BuildContext context) {
    TodoProviderShare todoProvider=Provider.of<TodoProviderShare>(context);
    return AlertDialog(
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
                providerfalse.addtodo(
                 description: txtid.text,
                  datetime: DateTime.now(),
                  task: txtname.text,
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
    );
  }
}