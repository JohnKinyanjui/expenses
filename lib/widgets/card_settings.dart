import 'package:expenses/models/constants.dart';
import 'package:flutter/material.dart';

class CardSettings extends StatelessWidget {
  final String title;
  final String sub;
  final Function Onprss;

  CardSettings({@required this.title,@required this.sub,@required this.Onprss});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: Onprss,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: cyan,
              blurRadius: 26,
              offset: Offset(5, 5)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: titlestyle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(sub,style: substyle),
            ),
          ],
        ),
      ),
    );
  }
}
