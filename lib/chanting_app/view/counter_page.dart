import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../provider/counter_provider.dart';
import '../utils/global.dart';
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
      body: RepaintBoundary(
        key: imagekey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundlist[counterProvidertrue.index]),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: Stack(
            children: [
              CounterDetails(counterProvidertrue: counterProvidertrue),
              Counter_Container(
                  counterProviderfalse: counterProviderfalse,
                  counterProvidertrue: counterProvidertrue),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.black.withOpacity(0.58))),
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        counterProviderfalse.background_Right_to_left();
                      },
                    ),
                    IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.black.withOpacity(0.58))),
                      alignment: Alignment.center,
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        counterProviderfalse.background_Left_to_Right();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingAction(
        counterProviderfalse: counterProviderfalse,
      ),
    );
  }
}
