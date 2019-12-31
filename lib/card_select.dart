import 'package:flutter/material.dart';

import 'models/constants.dart';

class CardSelect extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;

  CardSelect({@required this.text,@required this.color,@required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: color,
          border: Border.all(color: cyan,
          width: 1)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
          ),
        ),
      ),
    );
  }
}
