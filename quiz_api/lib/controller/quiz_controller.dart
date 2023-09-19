import 'dart:async';

import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier{
  
   int currentQuestionIndex = 0;
  bool isLoaded = false;
  List<String> optionsList = [];
  int seconds = 60;
  Timer? timer;
  int points = 0;
  //late Future quiz;
  List<Color> optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  get quiz => null; 
    resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }
    startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1),(timer){
      
        if(seconds>0){
          seconds--;
        }else{
         gotoNextQuestion(); 
        }
     notifyListeners();

    });
   }
    gotoNextQuestion(){
    isLoaded =false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds=60;
    startTimer();
   }

   getQuiz() {}
}