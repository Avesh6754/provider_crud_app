import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/stepper_widget/views/component/text_Horizontal.dart';

import '../provider/stepper_Provider.dart';

class StepperHorizontal extends StatelessWidget {
  const StepperHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<Stepper_Provider>(context, listen: true);
    var providerFlase = Provider.of<Stepper_Provider>(context, listen: false);
    return Stepper(
      type: StepperType.horizontal,
      onStepContinue: ()
      {
        providerFlase.nextStepHorizontal(context);
      },
      onStepCancel: ()
      {
        providerFlase.previousStepHorizontal();
      },
      onStepTapped: (value) {
        providerFlase.gotoStepVertical(value);
      },
      currentStep: providerTrue.currentindexHorizontal,
      steps: [
        Step(
          title: const Text('Profile  '),
          content: const Column(
            children: [
               HorizontalTextInputBox(
                hintText: 'First Name',
              ),
              SizedBox(height: 10,),
              HorizontalTextInputBox(
                hintText: 'Last name',
              ),
            ],
          ),
          isActive: providerTrue.currentindexHorizontal >= 0 ? true : false,
        ),

        //ADDRESS
        Step(
          title: const Text('Address'),
          content: const HorizontalTextInputBox(
            hintText: 'Address',
            max: 3,
            textInputType: TextInputType.streetAddress,
          ),
          isActive: providerTrue.currentindexHorizontal >= 1 ? true : false,
        ),

        //MOBILE NUMBER
        Step(
          title: const Text('Mobile'),
          content: const HorizontalTextInputBox(
            hintText: 'Mobile Number',
            textInputType: TextInputType.number,
          ),
          isActive: providerTrue.currentindexHorizontal >= 2 ? true : false,
        ),
      ],
    );
  }
}
