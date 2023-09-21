

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../controller/quiz_controller.dart';

SingleChildScrollView quiz_wrap(BuildContext context, QuizProvider quizProvider, data, Size size) {
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
                              quizProvider.cancelTimer();
                              quizProvider.resetTimer();
                              quizProvider.currentQuestionIndex=0;
                              quizProvider.quiz=null;
                              quizProvider.isLoaded=false;
                              Navigator.pop(context);
                             
                          //  Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
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
                          Text("${quizProvider.seconds}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: quizProvider.seconds / 60,
                              valueColor: const AlwaysStoppedAnimation(
                                  Colors.white),
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
                          icon: const Icon(CupertinoIcons.heart_fill,
                              color: Colors.white, size: 18),
                          label: Text("Like",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Question ${quizProvider.currentQuestionIndex + 1}of${data.length}",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 18))),
                  SizedBox(height: 20),
                  Text(
                    data[quizProvider.currentQuestionIndex]["question"],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 20,),
                  // ListView.builder for options
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: quizProvider.optionsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var answer = data[quizProvider.currentQuestionIndex]
                          ["correct_answer"];
                      return GestureDetector(
                        onTap: () {
                          if (answer.toString() ==
                                quizProvider.optionsList[index]
                                    .toString()) {
                              quizProvider.optionsColor[index] =
                                  Colors.green;
                              quizProvider.points += 10;
                            } else {
                              quizProvider.optionsColor[index] = Colors.red;
                            }

                            if (quizProvider.currentQuestionIndex <
                                data.length - 1) {
                              Future.delayed(const Duration(seconds: 1),
                                  () {
                                quizProvider.gotoNextQuestion();
                              });
                            } else {
                              quizProvider.timer!.cancel();
                              
                            }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          width: size.width - 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: quizProvider.optionsColor[index],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            quizProvider.optionsList[index].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
}