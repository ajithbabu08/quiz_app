import 'package:flutter/material.dart';

import 'homepage.dart';

class ResultScreen extends StatefulWidget {

  int score;
  ResultScreen(this.score,{Key? key}): super(key:key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Congratulations"),
        SizedBox(height: 50,),
        Text("Your Score is"),
        Text("${widget.score}"),
        SizedBox(height: 50,),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> quizHome()));
        }, child: Text("Repeat Quiz"),)
      ],
    ),
    );
  }
}
