import 'package:flutter/material.dart';

import '../../provider/homeprovider.dart';
import '../../utils/global.dart';

Future<dynamic> alertdialog(BuildContext context, GlobalKey<FormState> formkey, HomeProvider providerfalse) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(2),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return value!.isEmpty?"This deatils is mandatory":null;
                },
                controller: txtname,
                decoration: InputDecoration(
                    label: Text('Task'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  return value!.isEmpty?"This deatils is mandatory":null;
                },
                controller: txtid,
                maxLines: 2,
                decoration: InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2))),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if(formkey.currentState!.validate())
              {
                Navigator.of(context).pop();
                providerfalse.addstudent(
                    txtid!.text, txtname!.text, DateTime.now());
                txtname.clear();
                txtid.clear();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Task Save'),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            child: Text('Save'))
      ],
    ),
  );
}