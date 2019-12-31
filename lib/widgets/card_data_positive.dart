import 'package:expenses/models/constants.dart';
import 'package:flutter/material.dart';

class CardDataPositive extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final String sub;
  final double num;

  CardDataPositive({@required this.text,@required this.icon,@required this.iconColor,@required this.sub,@required this.num});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: cyan,
                        width: 1
                    )
                ),
                child: Center(
                  child: Icon(icon, color: iconColor,),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text,style: headstyle,),
                  Text(sub,style: substyle,)
                ],
              ),
            ),
            Text("+\$${num.toString()}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.green),),

          ],
        ),
      ),
    );
  }
}
