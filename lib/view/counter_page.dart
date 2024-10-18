import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/counter_provider.dart';


import 'component/counter_container.dart';
import 'component/counter_details.dart';
import 'component/speed_dial.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvidertrue =
        Provider.of<CounterProvider>(context, listen: true);
    CounterProvider counterProviderfalse =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            CounterDetails(counterProvidertrue: counterProvidertrue),
            Counter_Container(counterProviderfalse: counterProviderfalse, counterProvidertrue: counterProvidertrue),
          ],
        ),
      ),
      floatingActionButton: FloatingAction(counterProviderfalse: counterProviderfalse,),
    );
  }
}






