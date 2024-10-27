import 'package:flutter/material.dart';

import '../component/hiddenGridView.dart';
import '../component/hideSectionText.dart';

class Hiddenscreen extends StatelessWidget {
  const Hiddenscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
        leading: Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextHiddesection(name: 'Today',),
              HiddenGridView(length:20 ,folder: 'hidden1',),
              TextHiddesection(name: 'Yesterday',),
              HiddenGridView(length:15 ,folder: 'hidden2',),
            ],
          ),
        ),
      ),
    );
  }
}




