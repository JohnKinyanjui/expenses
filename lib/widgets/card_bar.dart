import 'package:flutter/material.dart';

import '../models/constants.dart';

class CardBar extends StatelessWidget {

  final String text;
  final double amount;
  final Color bColor;
  final IconData icon;
  final Color iconColor;
  CardBar({@required this.text,@required this.amount,@required this.icon,@required this.iconColor, this.bColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: cyan,width: 1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: iconColor,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: black),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${amount.toString()}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: black),),
            ),
          ],
        ),
      ),
    );
  }
}
