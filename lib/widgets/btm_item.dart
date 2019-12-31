import 'package:flutter/material.dart';

class BtmItem extends StatelessWidget {
  final Color color;
  final Function onPress;
  final Color iconColor;
  final IconData icon;

  BtmItem({@required this.onPress,@required this.color,@required this.iconColor,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Icon(icon, color: iconColor,),
        ),
      ),
    );
  }
}
