import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_api/view/home/quizscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            colors: Colors.primaries,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color:Colors.amber, width: 2),
                ),
                child: IconButton(
                    onPressed: () {
                      exit(0);
                    },
                    icon: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.white,
                      size: 28,
                    )),
              ),
            
              const SizedBox(height: 20),
              const Text("Welcome to our",style:TextStyle(color: Colors.white, fontSize: 18 )  ),
              Text("Quiz Maz",style:TextStyle(color: Colors.white, fontSize: 32)  ),
              
              const SizedBox(height: 20),
              Text("Do you feel confident? Here you'll face our most difficult questions!",
              style: TextStyle(
                color: Colors.white,
                  fontSize: 16,
              )),
                
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                  
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Text("Continue",style: TextStyle(color: Colors.blue,fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
    ) ),
    );
  }
}