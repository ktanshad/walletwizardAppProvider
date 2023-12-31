import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwizard/View/statiticsScreen/statiticsScreen.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import '../../model/add_datamodel.dart';

// ValueNotifier<List<add_dataModel>>graphNotifier=ValueNotifier(AddListNotifier.value);

class pichartExpense extends StatefulWidget {
  const pichartExpense({super.key});

  @override
  State<pichartExpense> createState() => _pichartExpenseState();
}

class _pichartExpenseState extends State<pichartExpense> {
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Consumer<DbFunctionProvider>(
      builder: (context, value, child) {
        var allExpense=Provider.of<DbFunctionProvider>(context).graphList.where((element) => element.moneytype=='Expense').toList();
        return  Provider.of<DbFunctionProvider>(context).graphList.isEmpty
      ?SingleChildScrollView(
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             SizedBox(height: size.height*0.2,),
               Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png'),
           ],
         ),
       ),
      )
      :SfCircularChart(
       series: <CircularSeries>[
         PieSeries<add_dataModel,String>(
           dataSource: allExpense,
           xValueMapper: (add_dataModel expenseDate,_)=>expenseDate.CategoryItem,
           yValueMapper: (add_dataModel expenseDate,_)=>num.parse(expenseDate.Amount),
         dataLabelSettings: const DataLabelSettings(
           isVisible: true,
         )
         )
       ],
       legend:const Legend(
         isVisible: true,
         overflowMode: LegendItemOverflowMode.scroll,
         alignment: ChartAlignment.center
       ) ,
      );
      },
      
    );
  }
}