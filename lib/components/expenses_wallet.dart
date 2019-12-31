import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesWallet {
   double balance;
  final double income;
   double spent;
  final double clothes;
  final double travel;
  final double luxury;
  final double electricity;
  final double extra_income;

  ExpensesWallet({@required this.income,@required this.clothes,@required this.luxury, @required this.travel,
   @required this.electricity,@required this.extra_income,});

     double getSpent (){
        spent = clothes + travel + electricity + luxury;
        return spent;
       }

     double getIncome(){
      double incom = income + extra_income;
      return incom;
     }
     double getBalance (){
        getSpent();
        balance = income +extra_income - spent ;
        return balance;
     }
}