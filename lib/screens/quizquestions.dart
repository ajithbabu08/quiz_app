import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_page.dart';

import '../data/questions_listpage.dart';

class Quiz_Screen extends StatefulWidget {
  const Quiz_Screen({super.key});

  @override
  State<Quiz_Screen> createState() => _Quiz_ScreenState();
}

class _Quiz_ScreenState extends State<Quiz_Screen> {

  PageController? _questioncontroller;
  int question_pos=0;
  int score=0;
  bool buttonPressed=false;
  String btnText= "Next Question";
  bool answered=false;

  @override
  void initState() {
    super.initState();
    _questioncontroller=PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple,
    body: PageView.builder(itemCount: questions.length,
        controller: _questioncontroller!,
    onPageChanged: (page){
      if(page==questions.length -1){
        setState(() {
          btnText= "See Result";
        });
      }
      setState(() {
        answered= false;
      });
    },
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text("Question ${index + 1}/10")),

          Divider(color: Colors.redAccent,),
          SizedBox(height: 15,),
          
          Text("${questions[index].question}"),

          for(int i=0;i<questions[index].answers!.length;i++)
            Container(
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: !answered? () {
                  if(questions[index].answers!.values.toList()[i]){
                    score++;
                    print("Yes");
                  }else{
                    print("No");
                  }
                  setState(() {
                    buttonPressed=true;
                    answered=true;
                  });
                }
                :null,
                child: Text(questions[index].answers!.keys.toList()[i]),
              ),
            ),
          SizedBox(height: 10,),
          RawMaterialButton(onPressed: (){
            if(_questioncontroller!.page?.toInt()==questions.length-1){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(score)));
            }
            else{
              _questioncontroller!.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInExpo);

              setState(() {
                buttonPressed=false;
              });
            }
          }
          ),
        ],
      );
      }
    ),
    );
  }
}
