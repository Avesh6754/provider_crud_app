import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/stepper_widget/provider/stepper_Provider.dart';
import 'package:provider_crud_app/stepper_widget/views/Stepper_Horizontal.dart';
import 'package:provider_crud_app/stepper_widget/views/Stepper_Vertical.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Stepper Demo',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Stepper_Provider>(context, listen: false)
                    .pageChange();
              },
              icon: (Provider.of<Stepper_Provider>(context, listen: true)
                      .ishorizontal)
                  ? Icon(
                      Icons.swap_horiz_outlined,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.vertical_align_bottom,
                      color: Colors.white,
                    ))
        ],
      ),
      body: Provider.of<Stepper_Provider>(context, listen: true).ishorizontal
          ? StepperHorizontal()
          : StepperVertical(),
    );
  }
}
