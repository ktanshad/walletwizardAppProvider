import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import 'package:walletwizard/controller/provider/utilityProvider.dart';

import 'package:walletwizard/view/StatiticsScreen/statiticsScreen.dart';
import '../../model/add_datamodel.dart';



class pichartAll extends StatefulWidget {
   const pichartAll({super.key});

  @override
  State<pichartAll> createState() => _pichartAllState();
}

class _pichartAllState extends State<pichartAll> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior=TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Consumer<DbFunctionProvider>(
      builder: (context, value, child) {
        Map incomeMap={
          "name":"Income","amount":UtilityProvider().income(),
        };
           Map expenseMap={
          "name":"Expense","amount":UtilityProvider().expense(),
        };
        List<Map>totalMap=[incomeMap,expenseMap];

        return Provider.of<DbFunctionProvider>(context).graphList.isEmpty
      ? SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: size.height*0.2,),
            Center(child: Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png'))
          ],
        ),
      )
      :SfCircularChart(
        tooltipBehavior:_tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<Map,String>(
            dataSource: totalMap,
            xValueMapper: (Map data,_)=>data["name"],
            yValueMapper: (Map data,_)=>data['amount'],
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )
          )
        ],
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.scroll,
          alignment: ChartAlignment.center
        ),
      );
      },
       
    );
  }
}