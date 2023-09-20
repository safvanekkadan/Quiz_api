// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quiz_api/controller/quiz_controller.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({Key? key}) : super(key: key);

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   // var currentQuestionIndex = 0;
//    //late Future quiz;
//   // var isLoaded = false;
//   // var optionsList = [];
//   // int seconds = 60;
//   // Timer? timer;
//   //  int points = 0;
   
//    //List  quiz=["results"];
//   @override
// void initState() {
//   super.initState();
//   final quizProvider = Provider.of<QuizProvider>(context, listen: false);
//   quizProvider.getQuiz(); // Assuming this method loads the quiz data.
//   quizProvider. startTimer();
// }

// @override
// void dispose() {
//   final quizProvider = Provider.of<QuizProvider>(context, listen: false);
//   quizProvider.timer!.cancel();
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<QuizProvider>(context);
    
//     return Scaffold(
//       body: SafeArea(
//         child:Consumer<QuizProvider>(
//           builder: (context, value, child) {
//           return Container(
//              width: double.infinity,
//           height: double.infinity,
//           padding: const EdgeInsets.all(12),
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors:Colors.accents,
//           )),
//           child:Consumer<QuizProvider>(
            
            
//           builder: (context, value, child ) {
//             print("ddsds");
//             if(value.quiz == null){
//               print("xcxdsf");
//                var data=value.getQuiz();
//               print("wdfgg");
//               if(!value.isLoaded==false){
//                 print("sss");
//                  value.optionsList =data[value.currentQuestionIndex]["incorrect_answers"];
//                 value.optionsList.add(data[value.currentQuestionIndex]["correct_answer"]);
//                 value.optionsList.shuffle();
//                   value.isLoaded = true;
//               }
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           border: Border.all(color: Colors.grey, width: 2),
                    //         ),
                    //         child: IconButton(
                    //             onPressed: () {
                    //               Navigator.pop(context);
                    //             },
                    //             icon: const Icon(
                    //               CupertinoIcons.xmark,
                    //               color: Colors.white,
                    //               size: 28,
                    //             )),
                    //       ),
                    //       Stack(
                    //         alignment: Alignment.center,
                    //         children: [
                    //           Text(
                    //             "$value.seconds",style:TextStyle(color:
                    //                   Colors.white, fontSize: 24,
                    //             )),
                    //           SizedBox(
                    //             width: 80,
                    //             height: 80,
                    //             child: CircularProgressIndicator(
                    //               value: value.seconds / 60,
                    //               valueColor: const AlwaysStoppedAnimation(Colors.white),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(16),
                    //           border: Border.all(color: Colors.grey, width: 2),
                    //         ),
                    //         child: TextButton.icon(
                    //             onPressed: null,
                    //             icon: const Icon(CupertinoIcons.heart_fill, color: Colors.white, size: 18),
                    //             label: Text("Like",style:TextStyle( color:Colors.white, fontSize: 14, )),
                    //       ),
                    //       ),
                    //     ],
                    // ),
                    // const SizedBox(height: 20),
                    //  Align(
                    //    alignment: Alignment.centerLeft,
                    //    child: Text("Question ${value.currentQuestionIndex+1}of${data.length}",
                    //    style: TextStyle( color:Colors.grey, fontSize: 18))),
                    //          SizedBox(height: 20),
                    //  Text(data[value.currentQuestionIndex]["question"],style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 18
                    //  ),),
                    //   const SizedBox(height: 20),   
                    //     ListView.builder(
                    //       shrinkWrap: true,
                    //       itemCount: value.optionsList.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         var answer= data[value.currentQuestionIndex]["correct_answer"];
                    //         return GestureDetector(
                    //           onTap: (){
                                
                    //               if(answer.toString()==value.optionsList[index].toString()){
                    //                 value.optionsColor[index]=Colors.green;
                    //                 value.points = value.points + 10;
                    //               }else{
                    //                 value.optionsColor[index]=Colors.red;
                    //               }
                    //               if(value.currentQuestionIndex<data.length-1){
                    //                 Future.delayed(Duration(seconds: 1),(){
                    //                 value.gotoNextQuestion();
                    //                 });
                    //               }else{
                    //                 value.timer!.cancel();
                    //               }
                                
        
                    //           },
                    //           child: Container(
                    //             margin: EdgeInsets.only(bottom: 20),
                    //             alignment: Alignment.center,
                    //             width: 100,
                    //             padding: EdgeInsets.all(16),
                    //             decoration: BoxDecoration(
                    //               color:value.optionsColor[index],
                    //               borderRadius: BorderRadius.circular(12),
                    //             ),
                    //             child: Text(value.optionsList[index].toString(),style: TextStyle(
                    //               color: Colors.blue,
                    //               fontSize: 18
                    //             ),
                    //             ),
                    //           ),
                    //         );
                    //     },
                    //     ),  
//                   ],
//                 ),
//               );
//              }else{
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor:AlwaysStoppedAnimation(Colors.white), 
//                 ),
//               );
//             }
            
//           }
//           )
//           );
//           }
//         ),
//         ) ,
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/quiz_controller.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
    @override
void initState() {
  super.initState();
  final quizProvider = Provider.of<QuizProvider>(context, listen: false);
   quizProvider. service.getQuiz(); // Assuming this method loads the quiz data.
   quizProvider. startTimer();
}

@override
void dispose() {
  final quizProvider = Provider.of<QuizProvider>(context, listen: false);
  quizProvider.timer!.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, value, child) {
        //value.initializeQuiz();
        //value.gotoNextQuestion();
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Colors.accents,
                ),
              ),
              child: FutureBuilder(
                future: value.quiz,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data['results'];
                    if (value.isLoaded == false) {
                      value.initializeQuiz();
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  color: Colors.white,
                                  size: 28,
                                )),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                "$value.seconds",style:TextStyle(color:
                                      Colors.white, fontSize: 24,
                                )),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: value.seconds / 60,
                                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(CupertinoIcons.heart_fill, color: Colors.white, size: 18),
                                label: Text("Like",style:TextStyle( color:Colors.white, fontSize: 14, )),
                          ),
                          ),
                        ],
                    ),
                    const SizedBox(height: 20),
                     Align(
                       alignment: Alignment.centerLeft,
                       child: Text("Question ${value.currentQuestionIndex+1}of${data.length}",
                       style: TextStyle( color:Colors.grey, fontSize: 18))),
                             SizedBox(height: 20),
                     Text(data[value.currentQuestionIndex]["question"],style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                     ),),
                      const SizedBox(height: 20),   
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.optionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var answer= data[value.currentQuestionIndex]["correct_answer"];
                            return GestureDetector(
                              onTap: (){
                                
                                  if(answer.toString()==value.optionsList[index].toString()){
                                    value.optionsColor[index]=Colors.green;
                                    value.points = value.points + 10;
                                  }else{
                                    value.optionsColor[index]=Colors.red;
                                  }
                                  if(value.currentQuestionIndex<data.length-1){
                                    Future.delayed(const Duration(seconds: 1),(){
                                    value.gotoNextQuestion();
                                    });
                                  }else{
                                    value.timer!.cancel();
                                  }
                                
        
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                width: 100,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color:value.optionsColor[index],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(value.optionsList[index].toString(),style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18
                                ),
                                ),
                              ),
                            );
                        },
                        ),  
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}