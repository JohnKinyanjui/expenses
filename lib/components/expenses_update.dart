import 'package:flutter/cupertino.dart';

class ExpensesUpdate {
  final double clothes;
  final double clothes1;
  final double travel;
  final double travel1;
  final double electricity;
  final double electricity1;
  final double luxury;
  final double luxury1;
  final double extra;
  final double extra1;

  double new_clothes;
  double new_travel;
  double new_electricity;
  double new_luxury;
  double new_extra;
  ExpensesUpdate({@required this.clothes,@required this.clothes1,
    @required this.travel,@required this.travel1 ,
    @required this.electricity,@required this.electricity1,
    @required this.luxury,@required this.luxury1,
    @required this.extra,@required this.extra1});

  double getClothesUpdate (){
     new_clothes = clothes  + clothes1;
     return  new_clothes;
  }
  double getTravelUpdate(){
    new_travel = travel + travel1;
    return new_travel;
  }
  double getElectricityUpdate(){
    new_electricity = electricity + electricity1;
    return new_electricity;
  }
  double getLuxuryUpdate(){
    new_luxury = luxury + luxury1;
    return new_luxury;
  }
  double getExtraUpdate(){
    new_extra = extra + extra1;
    return new_extra;
  }

}