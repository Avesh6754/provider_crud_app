import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int counter=0;
  int round=0;
  int totalcount=0;

  void incrementcounter()
  {
    counter++;
   if(counter>108)
     {
       counter=1;
     }
    notifyListeners();
  }
  void totalcounting()
  {
    totalcount++;
    notifyListeners();
  }
  void decrementcounter()
  {
    if(counter>0)
      {
        totalcount--;
        counter--;
      }
    notifyListeners();
  }
  void restartcounter()
  {

      counter=0;
    notifyListeners();
  }
  void counterround()
  {
    if(counter>=108)
      {
        round++;
      }
    notifyListeners();
  }
}