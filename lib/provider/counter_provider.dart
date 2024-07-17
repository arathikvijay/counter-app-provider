import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _counter=1;
  int get count=>_counter;
  void increment(){
    _counter++;
    
    notifyListeners();
  }
  void decrement(){
    _counter--;
    
    notifyListeners();
  }


}