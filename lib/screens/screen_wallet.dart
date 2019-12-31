import 'package:expenses/components/expenses_update.dart';
import 'package:expenses/components/expenses_wallet.dart';
import 'package:expenses/widgets/card_bar.dart';
import 'package:expenses/widgets/card_choice.dart';
import 'package:expenses/widgets/card_data.dart';
import 'package:expenses/widgets/card_data_positive.dart';
import 'package:expenses/widgets/card_income.dart';
import 'package:expenses/models/constants.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenWallet extends StatefulWidget {

  @override
  _ScreenWalletState createState() => _ScreenWalletState();
}

class _ScreenWalletState extends State<ScreenWallet> {
  @override
  void initState() {
    super.initState();
    getData();
    getSum();
  }
  list_types choicedtype =list_types.all;
  SharedPreferences preferences;
  ExpensesWallet expenses;
  ExpensesUpdate update;
  static double extra_income = 0;
  static double gc_text = 0 ;
  static double gt_text = 0 ;
  static double ge_text = 0;
  static double gl_text = 0;
  static double gi_text = 0;
  static double gx_text = 0;
  void getData() async {
    preferences = await SharedPreferences.getInstance();
    gi_text = preferences.getDouble("total_income");
    gc_text = preferences.getDouble("clothes_spent");
    gt_text = preferences.getDouble("travel_spent");
    ge_text = preferences.getDouble("electric_spent");
    gl_text = preferences.getDouble("luxury_spent");
    gx_text = preferences.getDouble("extra_income");
    print("wg got $gc_text,$gt_text,$ge_text,$gl_text");
  }
  void getSum(){
    expenses =ExpensesWallet(income: gi_text == null ? 0 : gi_text,
        clothes: gc_text == null ? 0 : gc_text,
        travel: gt_text == null ? 0 : gt_text,
        electricity: ge_text == null ? 0 : ge_text,
        extra_income: gx_text == null ? 0 : gx_text ,
        luxury: gl_text == null ? 0 : gl_text,
       );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CardIncome(text: "My Balance",amount: expenses.getBalance() == null ? 0 : expenses.getBalance(),),
          Row(
            children: <Widget>[
              Expanded(child: CardBar(bColor: black,text: "Income", amount: expenses.getIncome(), icon: FlevaIcons.trending_up_outline, iconColor: Colors.grey)),
              Expanded(child: CardBar(bColor: navy_blue,text: "Spent", amount: expenses.getSpent(), icon: FlevaIcons.trending_down_outline, iconColor: Colors.grey)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Transaction List",style: headstyle,),
          ),

          CardDataPositive(text: "Extra income", icon: FlevaIcons.trending_up_outline, iconColor: Colors.green, sub: "How much you spend in clothes.", num: gx_text == null ? 0 :gx_text),
          CardData(text: "Clothes", icon: FlevaIcons.trending_down_outline, iconColor: Colors.red, sub: "How much you spend in clothes.", num: gc_text == null ? 0 : gc_text),
          CardData(text: "Travel", icon: FlevaIcons.trending_down_outline, iconColor: Colors.red, sub: "How much you spend in travel.", num: gt_text == null ? 0 : gt_text),
          CardData(text: "Electricity", icon: FlevaIcons.trending_down_outline, iconColor: Colors.red, sub: "How much you spend in Electricity.", num: ge_text == null ? 0 :ge_text),
          CardData(text: "Luxury", icon: FlevaIcons.trending_down_outline, iconColor: Colors.red, sub: "How much you spend in clothes.", num: gl_text == null ? 0 :gl_text),
        ],
      ),
    );
  }
}

enum list_types {
 all,
 income,
 spent
}