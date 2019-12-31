import 'package:expenses/models/constants.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

  final String text;
  final IconData icon;
  final Function onPress;

  ProfileWidget({@required this.text,@required this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 70,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: cyan,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400, color: backgroundColor),),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Icon(icon, color: Colors.white,),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
              child: Container(
                width: 100,
                height: 4,
                color: backgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
