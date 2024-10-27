import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/todo_app/provider/TodoProvider.dart';
import 'package:provider_crud_app/todo_app/utils/global.dart';
import 'package:provider_crud_app/todo_app/view/component/datetime.dart';

import 'component/completedtask.dart';
import 'component/pendingtask.dart';
import 'component/profile.dart';

class Todo_App extends StatelessWidget {
  const Todo_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profiledata(),
              const SizedBox(
                height: 20,
              ),
             DateTimeClass(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    PendingTask(),
                    Completedtask()
                  ],
                ),
              ),
              SizedBox(height: 30,),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Icon(Icons.ads_click_outlined,size: 150,color: Colors.black12,),
                    Text('You have not completed anything',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1,fontSize: 20),),
                    Text('Complete some tasks to shift some over here.',style: TextStyle(fontSize: 12,color: Colors.black45,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton( backgroundColor: Colors.blue,onPressed: () {
        
      },child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}






