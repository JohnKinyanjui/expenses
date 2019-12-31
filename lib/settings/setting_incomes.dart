import 'package:expenses/widgets/card_set.dart';
import 'package:expenses/slither_widget.dart';
import 'package:expenses/widgets/card_income.dart';
import 'package:expenses/widgets/card_rectangle.dart';
import 'package:expenses/models/constants.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingIncomes extends StatefulWidget {
  SettingIncomes({Key key}) : super(key: key);



  @override
  _SettingIncomesState createState() => _SettingIncomesState();
}

class _SettingIncomesState extends State<SettingIncomes> {

  double income = 2000;
  double pNeeds = 20;
  double pWants = 20;
  double pSavings = 20;
  String budget_type = "budget1";
  budgets types = budgets.budget1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Up Incomes',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,
          color: Color(0xff000000)),),backgroundColor: backgroundColor,elevation: 0.0,
        iconTheme: IconThemeData(color: black),
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Add your Income",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: black),)),
              ),
              CardIncome(amount: double.parse(income.toString()), text: "Amount"),
             SlitherWidget(value: income, min: 0, max: 10000, onchanged: (double newValue ) {
               setState(() {
                 income = newValue.round().toDouble();
               });
             }),
                Row(
                children: <Widget>[
                  Expanded(
                    child: CardRectangle(onPress :(){
                      setState(() {
                        types = budgets.budget1;
                        budget_type = "budget1";
                      });

                    },bColor: types == budgets.budget1 ? cyan : backgroundColor,
                        tColor: types == budgets.budget1 ? backgroundColor : Colors.grey,
                        text: "Budget type 1"),
                  ),
                  Expanded(
                    child: CardRectangle(onPress :(){
                      setState(() {
                        types = budgets.budget2;
                        budget_type = "budget2";
                      });
                    },bColor: types == budgets.budget2 ? cyan : backgroundColor,
                        tColor: types == budgets.budget2 ? backgroundColor : Colors.grey,
                        text: "Budget type 2"),
                  ),
                  Expanded(
                    child: CardRectangle(onPress :(){
                      setState(() {
                        types = budgets.budget3;
                        budget_type = "budget3";

                      });
                    },bColor: types == budgets.budget3 ? cyan : backgroundColor,
                        tColor: types == budgets.budget3 ? backgroundColor : Colors.grey,
                        text: "Budget type 3"),
                  ),
                ],
              ),
              CardRectangle(onPress :(){
                setState(() {
                  types = budgets.custom_budgets;
                  budget_type = "custom_budgets";

                });
              },bColor: types == budgets.custom_budgets ? cyan : backgroundColor,
                  tColor: types == budgets.custom_budgets ? backgroundColor : Colors.grey,
                  text: "Custom Budgets"),

              CardSet(text: "Needs",percentage: pNeeds,),
              SlitherWidget(value: 20, min: 0, max: 100, onchanged: (double newValue ){
                setState(() {
                  pNeeds = newValue.round().toDouble();
                });

                print(newValue);
              }),
              CardSet(text: "Wants",percentage: pWants,),
              SlitherWidget(value: pWants, min: 0, max: 100, onchanged: (double newValue ){
                setState(() {
                  pWants = newValue.round().toDouble();
                });
                print(newValue);
              }),
              CardSet(text: "Savings",percentage: pSavings,),
              SlitherWidget(value: pSavings, min: 0, max: 100, onchanged: (double newValue ){
                setState(() {
                  pSavings = newValue.round().toDouble();
                });

                print(newValue);
              }
              ),
            ]
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setDouble('total_income', income);
          prefs.setString("budget_type", budget_type);
          prefs.setDouble('saving', pSavings);
          prefs.setDouble("wants", pWants);
          prefs.setDouble('needs', pNeeds);

          print(income);
          print(budget_type);
          print(pSavings);
          print(pNeeds);
          print(pWants);
        },
        backgroundColor: cyan,
        child: Center(
          child: Icon(FlevaIcons.save_outline,color: Colors.white,),
        ),
      ),
    );
  }
}

enum budgets {
  budget1,
  budget2,
  budget3,
  custom_budgets
}