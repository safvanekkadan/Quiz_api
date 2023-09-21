
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/quiz_controller.dart';
import 'widget/quiz_wrap.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).fetchQuiz();
    Provider.of<QuizProvider>(context, listen: false).startTimer();

  }

  @override
  Widget build(BuildContext context) {
    var quizProvider = Provider.of<QuizProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.red],
          ),
        ),
        child: FutureBuilder(
          future: quizProvider.quiz,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!['results'];
              if (!quizProvider.isLoaded) {
                quizProvider.optionsList =
                    data[quizProvider.currentQuestionIndex]
                        ["incorrect_answers"];
                quizProvider.optionsList.add(
                    data[quizProvider.currentQuestionIndex]
                        ["correct_answer"]);
                quizProvider.optionsList.shuffle();
                quizProvider.isLoaded = true;
              }
              return quiz_wrap(context, quizProvider, data, size);
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
    );
  }

  
  }
