import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/utils/global.dart';

class AlertDialodbox extends StatelessWidget {
  AlertDialodbox({
    super.key,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Task Add'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: Column(

              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Description TextField
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),

        ],

      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        // Save Button
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              Provider.of<TodoProvider>(context, listen: false).setTodo(
                  titleController.text, descriptionController.text,
                  '${datetime.hour} : ${datetime.minute}', 'false');
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
