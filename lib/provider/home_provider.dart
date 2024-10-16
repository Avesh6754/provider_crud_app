import 'package:flutter/material.dart';

import 'package:provider_crud_app/modal/modal_list.dart';

class BackgroundProvider extends ChangeNotifier {
  List background=backgroundimage;
  int selectedindex=0;
  void selectedimage(int index)
  {
    selectedindex=index;
    notifyListeners();
  }

}
