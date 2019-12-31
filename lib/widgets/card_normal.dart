import 'package:expenses/models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardNormal extends StatelessWidget {
  final Function onPress;
  final IconData icon;
  final String text;
  final String sub;
  CardNormal({@required this.onPress,@required  this.text,@required this.sub,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: cyan,
            width: 1
          )
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Icon(icon,color: Colors.black,)),
            ),
            Center(child: Text(text,style: headstyle,textAlign: TextAlign.center,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(sub,style: substyle,)),
            )
          ],
        ),
      ),
    );
  }
}
