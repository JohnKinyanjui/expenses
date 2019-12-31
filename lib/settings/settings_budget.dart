import 'package:expenses/widgets/card_settings.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';

class SettingsBudget extends StatelessWidget {

  double amount = 0.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan,
      appBar: AppBar(title: Text('Budgets',style: headstyle),backgroundColor: cyan,elevation: 0.0,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CardSettings(title: "Choose Type of Budget", sub: "BudgetType1", Onprss: (){

          }),
          Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                ),
                child: Column(
                  children: <Widget>[
                    Text('Your Amount',style: titlestyle,),
                    Expanded(
                      child:  Center(child: Text('KSH 0.0',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.grey),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Please choose the currency that will show you amount in the smallest unit possible",style: substyle,),
                    )
                  ],
                ),
              )
          ),
          CardSettings(title: "Type of Currency", sub: "Us Dollars", Onprss: (){

          }),
        ],
      ),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(onPressed: (){},backgroundColor: backgroundColor,child: Icon(FlevaIcons.edit_2_outline,color: cyan,),),
      ),
    );
  }
}
