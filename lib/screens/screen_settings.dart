import 'package:expenses/settings/setting_income_calculator.dart';
import 'package:expenses/settings/setting_incomes.dart';
import 'package:expenses/widgets/card_normal.dart';
import 'package:expenses/widgets/card_settings.dart';
import 'package:expenses/models/constants.dart';
import 'package:expenses/models/model_settings.dart';
import 'package:expenses/settings/settings_budget.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatefulWidget {
  ScreenSettings({Key key}) : super(key: key);

  @override
  _ScreenSettingsState createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings',style: headstyle,),backgroundColor: backgroundColor,elevation: 0.0,iconTheme: IconThemeData(color: black),),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: CardNormal(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SettingIncomes()));
              }, text: "Income", sub: "Set up your income", icon: FlevaIcons.monitor_outline)),
              Expanded(child: CardNormal(onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SettingIncomeCalculator()));
              }, text: "I-Calculator", sub: "calculate your daily income", icon: FlevaIcons.monitor_outline))

            ],
          )
        ],
      )
    );
  }
}