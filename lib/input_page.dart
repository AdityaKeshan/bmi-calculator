import 'package:bmi_calculator/CalcBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cardchid.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import 'ResultPage.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    update: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? active : inactive,
                    cardchild: CardChild(
                      text: 'MALE',
                      fontWeigh: selectedGender == Gender.male
                          ? FontWeight.bold
                          : FontWeight.normal,
                      textColor: Color(0xFF8D8E98),
                      icon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      size: 18.0,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    update: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? active : inactive,
                    cardchild: CardChild(
                      text: 'FEMALE',
                      fontWeigh: selectedGender == Gender.female
                          ? FontWeight.bold
                          : FontWeight.normal,
                      textColor: Color(0xFF8D8E98),
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: col,
              cardchild: Column(
                mainAxisAlignment:MainAxisAlignment.center,

                children: <Widget>[
                  Text('HEIGHT',style: TextStyle(
                    color:Color(0xFF8D8E98),
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString()
                        ,style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 50.0
                      ),),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                  overlayColor: Color(0x29EB1555),
                    thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      min: 120,
                      max: 250,
                      value: height.toDouble(),

                      onChanged: (double newval)
                      {
                        setState(() {
                          height=newval.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(colour: col,cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',style: TextStyle(
                        color:Color(0xFF8D8E98),
                      ),),
                      Text( weight.toString(),style:TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(iconData:
                            FontAwesomeIcons.minus
                              ,function: ()
                            {
                              setState(() {
                                if(weight>=2) {
                                  weight = weight - 1;
                                }
                              });

                            },
                          ),
                          SizedBox(width: 15.0,),
                          RoundedIconButton(iconData:
                          FontAwesomeIcons.plus
                              ,function: ()
                            {
                              setState(() {
                                weight=weight+1;
                              });

                            },
                          ),
                        ],
                      ),
                    ],
                  ),),

                ),
                Expanded(
                  child: ReusableWidget(colour: col,cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',style: TextStyle(
                        color:Color(0xFF8D8E98),
                      ),),
                      Text( age.toString(),style:TextStyle(
                          color: Colors.white,
                          fontSize: 50.0
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(iconData:
                          FontAwesomeIcons.minus
                            ,function: ()
                            {setState(() {
                              if(age>=2) {
                                age = age - 1;
                              }
                            });

                            },
                          ),
                          SizedBox(width: 15.0,),
                          RoundedIconButton(iconData:
                          FontAwesomeIcons.plus
                            ,function: ()
                            {
                              setState(() {
                                age=age+1;
                              });

                            },
                          ),
                        ],
                      ),
                    ],
                  ),),

                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              CalcBrain cb=new CalcBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
                bmi:cb.calculateBMI() ,
                interpret: cb.getIntepre(),
                stat: cb.getResult(),
              )));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20.0),
              height: bottomheight,
              margin: EdgeInsets.only(top: 10),
              color: Color(0xFFEB1555),
              alignment: Alignment.center,
              child: Text('CALCULATE',style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 25.0
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final Function function;
  RoundedIconButton({@required this.iconData,@required this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6.0,
      onPressed: function,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,

      ),
      child:Icon( iconData,
      color: Colors.white,),
    );
  }
}
