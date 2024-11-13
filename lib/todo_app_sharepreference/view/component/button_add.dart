import 'package:flutter/material.dart';
import 'package:provider_crud_app/todo_app_sharepreference/view/component/task_add.dart';


import '../../provider/TodoProvider.dart';
import '../../utils/global.dart';


class Add_Button extends StatelessWidget {
  const Add_Button({
    super.key,
    required this.formkey,
    required this.providerfalse,
  });

  final GlobalKey<FormState> formkey;
  final TodoProviderShare providerfalse;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        txtname=TextEditingController();
        txtid=TextEditingController();
        showDialog(
          context: context,
          builder: (context) => Task_Add(formkey: formkey, providerfalse: providerfalse),
        );
      },
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}
