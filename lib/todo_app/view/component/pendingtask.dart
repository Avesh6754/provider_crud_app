import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/TodoProvider.dart';

class PendingTask extends StatelessWidget {
  const PendingTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          bool status=false;
          Provider.of<TodoProvider>(context,listen: false).taskStatus(status);
        },
        child: Container(
          height: double.infinity,
          decoration: (!Provider.of<TodoProvider>(context,listen: true).iscompleted)?BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15)
          ):null,
          alignment: Alignment.center,
          child: Text('Pending',style: TextStyle(fontWeight: FontWeight.w600,color:(!Provider.of<TodoProvider>(context,listen: true).iscompleted)? Colors.white:Colors.black,fontSize: 18,letterSpacing: 1),),
        ),
      ),
    );
  }
}