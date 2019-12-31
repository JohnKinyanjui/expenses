import 'package:flutter/material.dart';
import '../models/constants.dart';

class CardEdit extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final Function onFinish;
  CardEdit({@required this.controller,@required this.icon,@required this.hint, this.onFinish});


  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: cyan,
                  width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            onEditingComplete: onFinish,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.all(10),
              prefix: Icon(icon, color: Colors.white,),
              border: InputBorder.none,
            ),
          ));

  }
}
