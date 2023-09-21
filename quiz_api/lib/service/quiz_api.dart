import 'dart:convert';

import 'package:http/http.dart' as http;



class QuizApiService{
 static var   link="https://opentdb.com/api.php?amount=20";

  static getQuiz()async{
  var res= await http.get(Uri.parse(link));
  if(res.statusCode==200){
    var data=jsonDecode(res.body.toString());
    print("data loaded");
    return data;
  }
}
}