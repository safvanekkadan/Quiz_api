import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_api/service/quiz_api.dart';
class QuizProvider extends ChangeNotifier {
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
   Future? quiz;

  int points = 0;

  var isLoaded = false;

  var optionsList = [];
 Future<void> fetchQuiz() async {
    if (quiz == null) {
      quiz =QuizApiService. getQuiz(); 
      await quiz; 
      notifyListeners();
    }
  }
  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  void initializeQuiz() {
    if (!isLoaded) {
      optionsList = [];
      optionsColor = [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ];
      isLoaded = true;
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        notifyListeners(); 
      } else {
        gotoNextQuestion();
      }
    });
  }

  void gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
    notifyListeners();
  }

  void resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }
  
  void cancelTimer() {
  timer?.cancel(); 
}

void resetTimer() {
  cancelTimer();
  seconds = 60; 
}
}