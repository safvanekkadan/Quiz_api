// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:quiz_api/service/quiz_api.dart';

// class QuizProvider extends ChangeNotifier{
  
//    int currentQuestionIndex = 0;
//   bool isLoaded = false;
//   List<String> optionsList = [];
//   int seconds = 60;
//   Timer? timer;
//   int points = 0;
//  // late  Future? quiz;
//   List<Color> optionsColor = [
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//   ];

//    get quiz => null; 
//     resetColors() {
//     optionsColor = [
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//     ];
//   }
//     startTimer(){
//     timer =Timer.periodic(const Duration(seconds: 1),(timer){
      
//         if(seconds>0){
//           seconds--;
//         }else{
//          gotoNextQuestion(); 
//         }
//      notifyListeners();

//     });
//    }
//     gotoNextQuestion(){
//     isLoaded =false;
//     currentQuestionIndex++;
//     resetColors();
//     timer!.cancel();
//     seconds=60;
//     startTimer();
//    }

//    getQuiz()async{
//     QuizApiService().getQuiz();
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';

import '../service/quiz_api.dart';


class QuizProvider extends ChangeNotifier {
  QuizApiService service = QuizApiService();
  var currentQuestionIndex = 0;
    Future? quiz;
  var isLoaded = false;
  List<String> optionsList = [];
  int seconds = 60;
  Timer? timer;
  int points = 0;

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        gotoNextQuestion();
      }
      notifyListeners(); // Notify listeners after the state changes
    });
  }

  void gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
    notifyListeners(); // Notify listeners after the state changes
  }

  void disposeTimer() {
    timer!.cancel();
    timer = null;
  }

  Future<void> loadQuiz() async {
    quiz =service. getQuiz();
    notifyListeners(); // Notify listeners after the state changes
  }

  // Future<void> initializeQuiz() async {
  //   var data = await service.getQuiz();
  //   if (isLoaded == false) {
  //     optionsList = data[currentQuestionIndex]["incorrect_answers"];
  //     optionsList.add(data[currentQuestionIndex]["correct_answer"]);
  //     optionsList.shuffle();
  //     isLoaded = true;
  //   }
  //   notifyListeners(); // Notify listeners after the state changes
  // }
  Future<void> initializeQuiz() async {
  quiz = service.getQuiz();
  var data = await quiz; // Await for the data
  if (isLoaded == false) {
    optionsList = data[currentQuestionIndex]["incorrect_answers"];
    optionsList.add(data[currentQuestionIndex]["correct_answer"]);
    optionsList.shuffle();
    isLoaded = true;
  }
  notifyListeners(); // Notify listeners after the state changes
}
}

