import 'package:flutter/material.dart';
import 'package:provider_crud_app/todo_app_sharepreference/view/component/textfield.dart';


import '../../provider/TodoProvider.dart';
import '../../utils/global.dart';

class UpdateTask extends StatelessWidget {
  const UpdateTask({
    super.key,
    required this.formkey,
    required this.index,
    required this.providerfalse,
  });

  final GlobalKey<FormState> formkey;
  final TodoProviderShare providerfalse;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                height: 10,
              ),
              TextForm(name: txtname,label: 'Task',),

              TextForm(name: txtid,label: 'Description',),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (formkey.currentState!
                  .validate()) {
                Navigator.of(context).pop();
                providerfalse.updatetodo(
                    task: txtname.text,
                datetime: DateTime.now(),
                description: txtid.text,
                index: index);
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
    );
  }
}