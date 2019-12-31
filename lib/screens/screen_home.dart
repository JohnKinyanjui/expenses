import 'package:expenses/widgets/card_bar.dart';
import 'package:expenses/widgets/card_data.dart';
import 'package:expenses/widgets/card_income.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/card_show.dart';
import '../components/expenses_system.dart';
import '../models/constants.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();

}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    getData();

    print("What should be shown");
    print(sys.getNeeds());
    print(sys.getSavings());
    print(sys.getWants());

  }


  getData() async {
    sys = ExpensesSystem(total_income: total_income, budget_type: budgettype, wants: wants, needs: needs,saving: saving);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total_income = prefs.getDouble('total_income') ?? '';
      budgettype = prefs.getString("budget_type");
      saving = prefs.getDouble('saving');
      wants = prefs.getDouble("wants");
      needs = prefs.getDouble('needs');
    });
    print("total income is $total_income");
    print("Bugdet type is $budgettype");
    print("Saving is $saving");
    print("Wants is $wants");
    print("Needs is $needs");
  }

  static double total_income = 0.0 ;
  static double saving = 0.0;
  static double wants = 0.0;
  static double needs = 0.0;
  static String budgettype;
  ExpensesSystem sys;

  static String n = "0";
   var none =n.toString();

   int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    setState(() {
                      if (pieTouchResponse.touchInput is FlLongPressEnd ||
                          pieTouchResponse.touchInput is FlPanEnd) {
                        touchedIndex = -1;
                      } else {
                        touchedIndex = pieTouchResponse.touchedSectionIndex;
                      }
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections()),
            ),
          ),
        ),
       CardIncome(amount: total_income, text: "Total Income"),
       Row(children: <Widget>[
         Expanded(child: CardShow(bColor:  Colors.greenAccent,text: "Needs", amount: sys.getNeeds() == null ? 0 : sys.getNeeds(),)),
         Expanded(child: CardShow(bColor: Colors.blueAccent,text: "Wants", amount: sys.getWants() == null ? 0 : sys.getWants() )),
       ],),
        Expanded(child: CardShow(bColor: Colors.red,text: "Savings", amount: sys.getSavings() == null ? 0 : sys.getSavings(),)),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: sys.getPNeeds() == null ? 0 :sys.getPNeeds(),
            title: sys.getPNeeds().toString() == null ? 0 :sys.getPNeeds().toString()  +"%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: sys.getPWants() == null ? 0 :sys.getPWants(),
            title: sys.getPWants().toString() == null ? 0 :sys.getPWants().toString()+"%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: sys.getPSaving() == null ? 0 : sys.getPSaving(),
            title: sys.getPSaving().toString() == null ? 0 : sys.getPSaving().toString() +"%"
            ,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
