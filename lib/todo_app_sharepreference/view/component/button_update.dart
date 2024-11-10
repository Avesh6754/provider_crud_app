import 'package:flutter/material.dart';
import 'package:provider_crud_app/todo_app_sharepreference/view/component/updatetask.dart';


import '../../provider/TodoProvider.dart';
import '../../utils/global.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.providertrue,
    required this.formkey,
    required this.providerfalse,
    required this.index,
  });

  final TodoProviderShare providertrue;
  final int index;
  final GlobalKey<FormState> formkey;
  final TodoProviderShare providerfalse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                txtid.text = providertrue.todolist[index].description;
                txtname.text =
                    providertrue.todolist[index].task;
                showDialog(
                  context: context,
                  builder: (context) => UpdateTask(formkey: formkey, providerfalse: providerfalse,index: index,),
                );
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                providerfalse.removetodo(index);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}