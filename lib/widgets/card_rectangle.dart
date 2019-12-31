import 'package:expenses/models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardRectangle extends StatelessWidget {

  final Color bColor;
  final Color tColor;
  final String text;
  final Function onPress;
  CardRectangle({@required this.bColor,@required this.tColor,@required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: cyan,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color:bColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(fontWeight: FontWeight.w300, color: tColor,fontSize: 10),),
          ),
        ),
      ),
    );
  }
}
