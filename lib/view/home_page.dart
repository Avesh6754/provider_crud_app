import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/homeprovider.dart';
import 'package:provider_crud_app/utils/global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider providertrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider providerfalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Student Data',
        ),
      ),
      body: Column(
        children: [
          ...List.generate(
              providertrue.studentdata.length,
              (index) => Card(
                    child: ListTile(
                      leading: Text('${index + 1}'),
                      title: Text('${providertrue.studentdata[index].name}'),
                      subtitle: Text('${providertrue.studentdata[index].id}'),
                    ),
                  )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    TextField(
                      controller: providertrue.txtname,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue,width: 2)
                      )),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: providertrue.txtid,
                      decoration: InputDecoration(border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      )),
                    ),

                  ],
                ),

              ),actions: [
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  providerfalse.addstudent(providertrue.txtid!.text,providertrue.txtname!.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Save'),duration: Duration(seconds: 2),));
                }, child: Text('Save'))
            ],
            ),
          );
        },child: Icon(Icons.add),
      ),
    );
  }
}
