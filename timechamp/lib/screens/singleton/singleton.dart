import 'package:flutter/material.dart';

class ExampleState{
  @protected
   late String initialText;

  @protected
   late String stateText;

  static final ExampleState _instance = ExampleState._internal() ;

  String get currentText => stateText;

  void setStateText(String text){
    stateText = text;
  }

  void reset(){
    stateText = initialText;
  }

  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    initialText = 'A new instance has been created';
    stateText = initialText;
  }


}