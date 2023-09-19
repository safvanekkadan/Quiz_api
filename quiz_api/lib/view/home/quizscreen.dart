import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/quiz_api.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  late Future quiz;
  var isLoaded = false;
  var optionsList = [];
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

   @override
   void initState() {
    super.initState();
     quiz = getQuiz();
    startTimer();
  }
  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

   startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1),(timer){
      setState(() {
        if(seconds>0){
          seconds--;
        }else{
         gotoNextQuestion(); 
        }
      });

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
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
           width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:Colors.accents,
        )),
        child:FutureBuilder(
          future: quiz, 
        builder: ( BuildContext context,AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            var data= snapshot.data['results'];
            if(isLoaded==false){
               optionsList = data[currentQuestionIndex]["incorrect_answers"];
                optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                optionsList.shuffle();
                isLoaded = true;
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
                              "$seconds",style:TextStyle(color:
                                    Colors.white, fontSize: 24,
                              )),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: seconds / 60,
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
                     child: Text("Question ${currentQuestionIndex+1}of${data.length}",
                     style: TextStyle( color:Colors.grey, fontSize: 18))),
                           SizedBox(height: 20),
                   Text(data[currentQuestionIndex]["question"],style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                   ),),
                    const SizedBox(height: 20),   
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var answer= data[currentQuestionIndex]["correct_answer"];
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                if(answer.toString()==optionsList[index].toString()){
                                  optionsColor[index]=Colors.green;
                                  points = points + 10;
                                }else{
                                  optionsColor[index]=Colors.red;
                                }
                                if(currentQuestionIndex<data.length-1){
                                  Future.delayed(Duration(seconds: 1),(){
                                  gotoNextQuestion();
                                  });
                                }else{
                                  timer!.cancel();
                                }
                              });

                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              width: 100,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:optionsColor[index],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(optionsList[index].toString(),style: TextStyle(
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
           }else{
            return const Center(
              child: CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation(Colors.white), 
              ),
            );
          }
          
        }
        )
        ),
        ) ,
    );
  }
}
