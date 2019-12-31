import 'package:expenses/models/constants.dart';
import 'package:flutter/material.dart';

class FloatingActionBar extends StatelessWidget {
  final IconData icon;
  final onPress;
  FloatingActionBar({@required this.icon,@required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: cyan
        ),
        child: Center(
          child: Icon(icon,color: Colors.white,),
        ),
      ),
    );
  }
}
