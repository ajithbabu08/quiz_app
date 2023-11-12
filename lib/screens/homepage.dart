import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quizquestions.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
    home: quizHome(),));
}


class quizHome extends StatefulWidget {
  const quizHome({super.key});

  @override
  State<quizHome> createState() => _quizHomeState();
}

class _quizHomeState extends State<quizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,horizontal: 12.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("PSC Quiz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
            SizedBox(height: 120,),
            Expanded(
                child: Center(
                  child: RawMaterialButton(highlightColor: Colors.green,
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Quiz_Screen()));
                  },shape: StadiumBorder(),
                  fillColor: Colors.white,
                    child: const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24),
                  child: Text("Start Quiz",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                )
                  ),
                ),

            ),
          ],
        ),
      ),
    );
  }
}
