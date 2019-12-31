import 'package:expenses/models/constants.dart';
import 'package:expenses/settings/setting_incomes.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/profile_widget.dart';

class ScreenProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: cyan,
            ),
            child: Column(
              children: <Widget>[
                ProfileWidget(onPress : (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SettingIncomes()));
                },text: "Setting Up Incomes", icon: FlevaIcons.save_outline),
                ProfileWidget(onPress : (){

                },text: "Contact Us", icon: FlevaIcons.message_square_outline),
                ProfileWidget(onPress : (){

                },text: "FAQ", icon: FlevaIcons.question_mark_circle_outline),
                ProfileWidget(onPress : (){

                },text: "Refer to A friend", icon: FlevaIcons.people_outline)
              ],
            ),
          ),
        ),
        Container(
           margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: cyan,
          ),
          child :ProfileWidget(onPress : (){

          },text: "Sign Out", icon: FlevaIcons.close_outline),
         )
      ],
    );
  }
}
