import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/stepper_widget/provider/stepper_Provider.dart';

import 'component/text_class.dart';

class StepperVertical extends StatelessWidget {
  const StepperVertical({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    var providerTrue = Provider.of<Stepper_Provider>(context, listen: true);
    var providerFlase = Provider.of<Stepper_Provider>(context, listen: false);
    return Stepper(
        currentStep: providerTrue.currentindex,
        onStepCancel: () {
          providerFlase.previousStepVertical();
        },
        onStepContinue: () {
          providerFlase.nextStepVertical(context);
        },
        onStepTapped: (value) {
          providerFlase.gotoStepVertical(value);
        },
        steps: [
          Step(
            title: const Text('Account'),
            content: const TextInputBox(
              hintText: 'Account Number',
              textInputType: TextInputType.number,
            ),
            isActive: providerTrue.currentindex >= 0 ? true : false,
          ),

          //ADDRESS
          Step(
            title: const Text('Address'),
            content: const TextInputBox(
              hintText: 'Address',
              textInputType: TextInputType.streetAddress,
            ),
            isActive: providerTrue.currentindex >= 1 ? true : false,
          ),

          //MOBILE NUMBER
          Step(
            title: const Text('Mobile Number'),
            content: const TextInputBox(
              hintText: 'Mobile Number',
              textInputType: TextInputType.number,
            ),
            isActive: providerTrue.currentindex >= 2 ? true : false,
          ),
        ],
    );
  }
}
