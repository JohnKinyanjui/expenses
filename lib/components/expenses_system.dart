import 'dart:math';
import 'dart:wasm';

import 'package:flutter/cupertino.dart';

class ExpensesSystem {
  ExpensesSystem({@required this.total_income,@required this.budget_type,this.saving,@required this.wants,@required this.needs, });
  final double total_income;
  final String budget_type;
  final double saving;
  final double wants;
  final double needs;

 //Budget1
//  Senator Elizabeth Warren popularized the 50/20/30 budget rule in her book “All Your Worth: The Ultimate Lifetime Money Plan.”
//  The basic rule is to divide after-tax income, spending 50% on needs and 30% on wants while allocating 20% to savings.
 double  getNeeds (){
   if (budget_type == "budget1") {
     double need = (50 * total_income)/100;
     return need;
   }else if(budget_type == "budget2"){
     double need = (50 * total_income)/100;
     return need;
   }else if(budget_type == "budget3"){
     double need = (50 * total_income)/100;
     return need;
   }else if(budget_type == "custom_budgets"){
     double need = (needs * total_income)/100;
     return need;
   }
}

 double getWants(){
   if (budget_type == "budget1") {
     double want = (30 * total_income)/100;
     return want;
   }else if(budget_type == "budget2"){
     double want = (30 * total_income)/100;
     return want;
   }else if(budget_type == "budget3"){
     double want = (30 * total_income)/100;
     return want;
   }else if(budget_type == "custom_budgets"){
     double want  = (wants * total_income)/100;
   return want;
   }
 }

  double getSavings(){
    if (budget_type == "budget1") {
      double savings = (20 * total_income)/100;
      return savings;
    }else if(budget_type == "budget2"){
      double savings = (20 * total_income)/100;
      return savings;
    }else if(budget_type == "budget3"){
      double savings = (20 * total_income)/100;
      return savings;
    }else  if(budget_type == "custom_budgets"){
      double savings = (saving * total_income)/100;
      return savings;
    }
  }
  double getPNeeds () {
    if (budget_type == "budget1") {
      double need = 50;
      return need;
    } else if (budget_type == "budget2") {
      double need = 50;
      return need;
    } else if (budget_type == "budget3") {
      double need = 50;
      return need;
    } else if (budget_type == "custom_budgets") {
      double need = needs.toDouble();
      return need;
    }
  }
  double getPWants() {
    if (budget_type == "budget1") {
      double want =30;
      return want;
    } else if (budget_type == "budget2") {
      double want = 30;
      return want;
    } else if (budget_type == "budget3") {
      double want = 30;
      return want;
    } else if (budget_type == "custom_budgets") {
      double want = wants.toDouble();
      return want;
    }
  }
  double getPSaving (){
    if (budget_type == "budget1") {
      double savings = 20;
      return savings;
    }else if(budget_type == "budget2"){
      double savings = 20;
      return savings;
    }else if(budget_type == "budget3"){
      double savings = 20;
      return savings;
    }else  if(budget_type == "custom_budgets"){
      double savings = saving.toDouble();
      return savings;
    }
  }

  /*
  * Wallet Calculating what will be used.
  * Estimate how much is used each day.
  * */

  double getIncomePerDay() {

  }

}

