import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/ReusableCard.dart';
class ResultPage extends StatelessWidget {
  String bmi;
  String interpret;
  String stat;

  ResultPage({this.bmi, this.interpret, this.stat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('BMI CALCULATOR'),
    ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('Your Result',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),),
                ),
            ),
            Expanded(
              flex: 5,
              child: ReusableWidget(
                colour: col,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(stat,style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,

                    ),),
                    Text(bmi,style: TextStyle(fontSize: 100.0,fontWeight: FontWeight.bold,
                    color: Colors.white),),
                    Text(interpret,style: TextStyle(fontSize: 22.0,
                    color: Colors.white),
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20.0),
                height: bottomheight,
                margin: EdgeInsets.only(top: 10),
                color: Color(0xFFEB1555),
                alignment: Alignment.center,
                child: Text('RE-CALCULATE',style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 25.0
                ),),
              ),
            ),
          ],
        )
    );
  }
}
