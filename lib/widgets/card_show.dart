import 'package:flutter/material.dart';

import '../models/constants.dart';

class CardShow extends StatelessWidget {

  final String text;
  final double amount;
  final Color bColor;
  CardShow({@required this.text,@required this.amount,@required this.bColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: bColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: backgroundColor),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${amount.toString()}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: backgroundColor),),
            ),
          ],
        ),
      ),
    );
  }
}
