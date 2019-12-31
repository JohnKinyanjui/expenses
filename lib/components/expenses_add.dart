import 'package:flutter/cupertino.dart';

class ExpensesAdd {
  final double cl1;
  final double cl2;
  final double t1;
  final double t2;
  final double el1;
  final double el2;
  final double l1;
  final double l2;
  ExpensesAdd({@required this.cl1,@required this.cl2,@required this.t1,@required this.t2,@required this.el1,@required this.el2,@required this.l1,@required  this.l2,});

  double AddClothes (){
    double Clothing = cl1 + cl2;
    return Clothing;
  }
  double AddTravel (){
    double Travel = t1 + t2;
    return Travel;
  }
  double AddElectric (){
    double electric = el1 + el2;
    return electric;
  }

  double AddLuxury (){
    double luxury = l1 + l2;
    return luxury;
  }
}