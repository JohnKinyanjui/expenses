import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardChoice extends StatelessWidget {
  final String text;
  final Color tColor;
  final Color bColor;
  final Function onPress;
  CardChoice({@required this.text,@required this.tColor,@required this.bColor, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 5.0),
        height: 25,
        width: 70,
        decoration: BoxDecoration(
          color: bColor,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
          child: Center(
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold,color: tColor),),
          ),
        ),
      ),
    );
  }
}
