import 'package:flutter/material.dart';

class Stepper_Provider extends ChangeNotifier {
  int currentindex = 0;
  int currentindexHorizontal = 0;
  bool ishorizontal=false;

  void pageChange()
  {
    ishorizontal=!ishorizontal;
    notifyListeners();
  }

  void nextStepVertical(BuildContext context) {
    if (currentindex < 2) {
      currentindex++;
    } else {
      submit(context);
    }
    notifyListeners();
  }

  void previousStepVertical() {
    if (currentindex > 0) {
      currentindex--;
    }
    notifyListeners();
  }

  void gotoStepVertical(int value) {
    currentindex = value;
    notifyListeners();
  }

  void nextStepHorizontal(BuildContext context) {
    if (currentindexHorizontal < 2) {
      currentindexHorizontal++;
    } else {
      submit(context);
    }
    notifyListeners();
  }

  void previousStepHorizontal() {
    if (currentindexHorizontal > 0) {
      currentindexHorizontal--;
    }
    notifyListeners();
  }

  void gotoStepHorizontal(int value) {
    currentindexHorizontal = value;
    notifyListeners();
  }

  void submit(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Submitted'),
      duration: Duration(seconds: 3),
    ));
  }
}
