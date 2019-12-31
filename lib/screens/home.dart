import 'package:expenses/card_select.dart';
import 'package:expenses/components/expenses_update.dart';
import 'package:expenses/floating_action_bar.dart';
import 'package:expenses/slither_widget.dart';
import 'package:expenses/widgets/btm_item.dart';
import 'package:expenses/models/constants.dart';
import 'package:expenses/screens/screen_home.dart';
import 'package:expenses/screens/screen_profile.dart';
import 'package:expenses/screens/screen_schedule.dart';
import 'package:expenses/screens/screen_settings.dart';
import 'package:expenses/screens/screen_wallet.dart';
import 'package:expenses/widgets/card_edit.dart';
import 'package:expenses/widgets/card_income.dart';
import 'package:expenses/widgets/card_set.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static var extra_controller = TextEditingController();
  static var clothes_controller = TextEditingController();
  static var travel_controller = TextEditingController();
  static var elctric_controller = TextEditingController();
  static var luxury_controller = TextEditingController();


  double num = 20.0;
  double new_num1= 0;
  double new_num2 = 0;
  double new_num3 = 0;
  double new_num4 = 0;
  double new_num5 = 0;
  ExpensesUpdate update;
  actions action = actions.cancel;
  selects select = selects.clothes;
  items choosedItem = items.item1;
  SharedPreferences preferences;
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget>screens = [
    ScreenHome(),ScreenWallet(),ScreenSchedule(),ScreenProfile()
  ];
  Widget currentScreen = ScreenHome();
  static double gc_text ;
  static double gt_text ;
  static double ge_text ;
  static double gl_text ;
  static double gi_text;
  static double gx_text;

  void getData() async {
    preferences = await SharedPreferences.getInstance();
    gi_text = preferences.getDouble("total_income");
    gc_text = preferences.getDouble("clothes_spent");
    gt_text = preferences.getDouble("travel_spent");
    ge_text = preferences.getDouble("electric_spent");
    gl_text = preferences.getDouble("luxury_spent");
    gx_text = preferences.getDouble("extra_income");
    print("This is previos value is income$gi_text , clothes is $gc_text, travel is $gt_text ,electricity is $ge_text,$gl_text,extra is $gx_text");
  }
  bool isVisible (){
    if (action == actions.cancel) {
      setState(() {
        action = actions.open;
      });
      return true;
    } else{
      setState(() {
        action = actions.cancel;
      });
      return false;
    }
  }

 void updateSpents() async{
    update = ExpensesUpdate(
        //clothes
        clothes: gc_text == null ? gc_text = 0 : gc_text, clothes1: new_num1 == null ? new_num1 = 0 : new_num1,
        //travel
        travel: gt_text == null ? gt_text = 0 : gt_text, travel1: new_num2 == null ? new_num2 = 0 : new_num2,
        //electricity
        electricity: ge_text == null ? ge_text = 0 : ge_text, electricity1: new_num3 == null ? new_num3 = 0 : new_num3,
        //luxury
        luxury: gl_text == null ? gl_text = 0 : gl_text , luxury1: new_num4 == null ? new_num4 = 0 : new_num4,
        //extras
        extra: gx_text == null ?gx_text = 0 : gx_text, extra1: new_num5 == null ? new_num5 = 0 : new_num5);
    preferences = await SharedPreferences.getInstance();
    double newClothes = update.getClothesUpdate() == null ? 0 : update.getClothesUpdate();
    double newTravel = update.getTravelUpdate() == null ? 0 : update.getTravelUpdate();
    double newElectricity = update.getElectricityUpdate() == null ? 0 :update.getElectricityUpdate();
    double newLuxury = update.getLuxuryUpdate() == null ? 0 : update.getLuxuryUpdate();
      double newExtraIncome = update.getExtraUpdate() == null ? 0 : update.getExtraUpdate();

    preferences.setDouble("clothes_spent", newClothes);
    preferences.setDouble("travel_spent",newTravel);
    preferences.setDouble("electric_spent",newElectricity);
    preferences.setDouble("luxury_spent", newLuxury);
    preferences.setDouble("extra_income", newExtraIncome);
    print("we clothes is $newClothes,travel is $newTravel,electricity is $newElectricity,luxury is $newLuxury,extra is $newExtraIncome");

 }

 void reset (){


 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundColor,elevation: 0.0,title: Text('Expenses',style: headstyle,),actions: <Widget>[
        IconButton(icon :Icon(FlevaIcons.settings_outline, color: Colors.black),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ScreenSettings()));
        },)
      ],),
      body: Stack(
        children: <Widget>[
          PageStorage(bucket: bucket, child: currentScreen),
         Visibility(
           visible: action == actions.open ? true : false,
           child: Positioned(
             bottom: 5.0,
             left: 120.0,
             right: 0.0,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: cyan,
                            blurRadius: 20,
                            offset: Offset(10, 10)
                          )
                        ]
                      ),
                      height: 600,
                      width: 300,
                      child: Stack(
                        children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Add On",style:  headstyle,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("*You can always add your daily expenses which will be autimatically update.",style:  substyle,),
                                    ),
                                    CardIncome(amount: new_num5 == null ? new_num5 = 0 : new_num5, text: "Extra Income"),
                                    CardEdit(controller: extra_controller, icon: FlevaIcons.minus_outline, hint: "Extra Income",onFinish: (){
                                      setState(() {
                                        new_num5 = double.parse(extra_controller.text);
                                      });
                                    },),
                                    CardIncome(amount: new_num1 == null ? new_num1 = 0 : new_num1, text: "Clothes"),
                                    CardEdit(controller: clothes_controller, icon: FlevaIcons.minus_outline, hint: "Clothes",onFinish: (){
                                      setState(() {
                                        new_num1 = double.parse(clothes_controller.text);
                                      });
                                    },),
                                    CardIncome(amount: new_num2 == null ? new_num2 = 0 : new_num2, text: "Travel"),
                                    CardEdit(controller: travel_controller, icon: FlevaIcons.minus_outline, hint: "Travel",onFinish: (){
                                      setState(() {
                                        new_num2 = double.parse(travel_controller.text);
                                      });
                                    },),
                                    CardIncome(amount: new_num3 == null ? new_num3 = 0 : new_num3, text: "Electricity"),
                                    CardEdit(controller: elctric_controller, icon: FlevaIcons.minus_outline, hint: "Electricity",onFinish: (){
                                      setState(() {
                                        new_num3 = double.parse(elctric_controller.text);
                                      });
                                    },),
                                    CardIncome(amount: new_num4 == null ? new_num4 = 0 : new_num4, text: "Luxury"),
                                    CardEdit(controller: luxury_controller, icon: FlevaIcons.minus_outline, hint: "Luxury",onFinish: (){
                                      setState(() {
                                        new_num4 = double.parse(luxury_controller.text);
                                      });
                                    },),
                                    SizedBox(height: 100,)
                                  ]
                              ),
                        ),
                        Positioned.fill(
                            bottom: 50,
                            child: GestureDetector(
                              onTap: (){
                                getData();
                                updateSpents();

                              },
                              child: Container(
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: backgroundColor,
                                            border: Border.all(color: Colors.grey, width: 1),
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: Align(child: Text('Update',style: TextStyle(color: cyan, fontWeight: FontWeight.w400),),)
                                    )

                                ),

                              ),
                            ))
                        ],
                      ),
                    ),
                  ),
                ),
         ),

        ],
      ),


        bottomNavigationBar:Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft :Radius.circular(20),topRight:Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: cyan,
                offset: Offset(20, 20),
                blurRadius: 40
              )
            ]
          ),
         child: Row(
           children: <Widget>[
             Expanded(
               child: BtmItem(onPress: (){
                 setState(() {
                   choosedItem = items.item1;
                   currentScreen = screens[0];
                 });
               },
                   color: choosedItem == items.item1 ? cyan : Colors.white,
                   iconColor: choosedItem == items.item1 ? Colors.white : Colors.black,
                   icon: FlevaIcons.home_outline
               ),
             ),
             Expanded(
               child: BtmItem(onPress: (){
                 setState(() {
                   choosedItem = items.item2;
                   currentScreen = screens[1];
                 });
               },
                   color: choosedItem == items.item2 ? cyan : Colors.white,
                   iconColor: choosedItem == items.item2 ? Colors.white : Colors.black,
                   icon: FlevaIcons.credit_card_outline
               ),
             ),
             FloatingActionBar(onPress: (){
              isVisible();

             },icon: action == actions.cancel ? FlevaIcons.plus_outline : FlevaIcons.close_outline,),
             Expanded(
               child: BtmItem(onPress: (){
                 setState(() {
                   choosedItem = items.item3;
                   currentScreen = screens[2];
                 });
               },
                   color: choosedItem == items.item3 ? cyan : Colors.white,
                   iconColor: choosedItem == items.item3 ? Colors.white : Colors.black,
                   icon: FlevaIcons.clock_outline
               ),
             ),
             Expanded(
               child: BtmItem(onPress: (){
                 setState(() {
                   choosedItem = items.item4;
                   currentScreen = screens[3];
                   reset();
                 });
               },
                   color: choosedItem == items.item4 ? cyan : Colors.white,
                   iconColor: choosedItem == items.item4 ? Colors.white : Colors.black,
                   icon: FlevaIcons.person_outline
               ),
             ),
           ],
         ),
        ),

    );
  }
}

enum items {
  item1,
  item2,
  item3,
  item4,
}

enum selects {
  clothes,travel,electricity,luxury,extra_income
}

enum actions {
  open,cancel
}