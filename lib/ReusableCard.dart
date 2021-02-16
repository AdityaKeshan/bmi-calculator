import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  final Function update;
  ReusableWidget({@required this.colour, this.cardchild,this.update});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          update();
      },
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}