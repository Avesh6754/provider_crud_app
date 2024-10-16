import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/home_provider.dart';
import 'package:provider_crud_app/view/component/grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BackgroundProvider providertrue =
        Provider.of<BackgroundProvider>(context, listen: true);
    BackgroundProvider providerfalse =
        Provider.of<BackgroundProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff000000),
        title: const Text(
          'Background',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GridViewData(providertrue: providertrue, providerfalse: providerfalse)
    );
  }
}


