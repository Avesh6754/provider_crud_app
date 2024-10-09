import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/homeprovider.dart';
import 'package:provider_crud_app/utils/global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>  formkey = GlobalKey<FormState>();
    HomeProvider providertrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider providerfalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Student Data',
          style: TextStyle(color: Colors.white),
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
                      subtitle: Text(
                          '${providertrue.studentdata[index].id}\n${providertrue.studentdata[index].dateTime}'),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  txtid.text =
                                      providertrue.studentdata[index].id;
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
                                                    TextFormField(
                                                      controller: txtname,
                                                      decoration: InputDecoration(
                                                          label: Text('Name'),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2))),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextField(
                                                      controller: txtid,
                                                      maxLines: 2,
                                                      decoration: InputDecoration(
                                                          label:
                                                              Text('Description'),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width: 2))),
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
                                                       providerfalse.updatestudent(
                                                           txtid!.text,
                                                           txtname!.text,
                                                           DateTime.now(),
                                                           index);
                                                       ScaffoldMessenger.of(
                                                           context)
                                                           .showSnackBar(SnackBar(
                                                         content:
                                                         Text('Update Save'),
                                                         duration:
                                                         Duration(seconds: 2),
                                                       ));
                                                     }
                                                  },
                                                  child: Text('Save'))
                                            ],
                                          ));
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
                            label: Text('Name'),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
