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
    return Scaffold(backgroundColor: Colors.deepPurple,
    body: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: double.infinity,
            child: Text("Congratulations",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(height: 50,),
        Text("Your Score is",
          style: TextStyle(color: Colors.white, fontSize: 34.0),),
        Text("${widget.score}",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 85.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 100,),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> quizHome()));
        },
          child: Text("Repeat Quiz"),)
      ],
    ),
    );
  }
}
