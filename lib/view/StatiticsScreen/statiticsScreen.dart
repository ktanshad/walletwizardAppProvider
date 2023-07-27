import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/Constants/colors.dart';
import 'package:walletwizard/View/StatiticsScreen/pichartAll.dart';
import 'package:walletwizard/View/StatiticsScreen/pichartExpense.dart';
import 'package:walletwizard/View/StatiticsScreen/pichartIncome.dart';
import 'package:walletwizard/controller/provider/statiticsProvider.dart';
// import 'package:walletwizard/db/functions/dbFunctions.dart';


import '../../controller/provider/dbFunctionsProvider.dart';
import '../../model/add_datamodel.dart';



class statiticsScreen extends StatefulWidget {
  const statiticsScreen({super.key});

  @override
  State<statiticsScreen> createState() => _statiticsScreenState();
}

class _statiticsScreenState extends State<statiticsScreen> {
//  String dateFilterTitle = "All";

 @override
  void initState() {
    super.initState();
    Provider.of<DbFunctionProvider>(context,listen: false).graphList=Provider.of<DbFunctionProvider>(context,listen: false).TransactionList;
  }

  
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Statitics',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
           flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient:appbarcolor,
      ),
    ),
          
          ),


          
          body: Column(
            children: [
              SizedBox(height: size.height*0.02,),

                Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  'Date  ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer<statiticsDropDownProvider >(
                  builder: (context, value, child) {
                    return PopupMenuButton<int>(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        70,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            value.dateFilterTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: const Text(
                          "All",
                        ),
                        onTap: () {
                        Provider.of<DbFunctionProvider>(context,listen: false).graphList=Provider.of<DbFunctionProvider>(context,listen: false).TransactionList;
                            value.dateFilterTitle = "All";
                            Provider.of<statiticsDropDownProvider >(context,listen: false).changevalue(value.dateFilterTitle );
                            
                        
                        },
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: const Text(
                          "Today",
                        ),
                        onTap: () {
                        Provider.of<DbFunctionProvider>(context,listen: false).graphList=Provider.of<DbFunctionProvider>(context,listen: false).TransactionList.where((element) => 
                         element.dateTime.day==DateTime.now().day &&
                         element.dateTime.year==DateTime.now().year ,).toList();
                
                            
                            value.dateFilterTitle = "Today";
                            Provider.of<statiticsDropDownProvider >(context,listen: false).changevalue(value.dateFilterTitle );
                          
                        },
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: const Text(
                          "Yesterday",
                        ),
                        onTap: () {
                        Provider.of<DbFunctionProvider>(context,listen: false).graphList=Provider.of<DbFunctionProvider>(context,listen: false).TransactionList.where((element) => 
                        element.dateTime.day==DateTime.now().day-1 &&
                        element.dateTime.month==DateTime.now().month &&
                        element.dateTime.year==DateTime.now().year,).toList();
                          
                         
                           value. dateFilterTitle = "Yesterday";
                           Provider.of<statiticsDropDownProvider >(context,listen: false).changevalue(value.dateFilterTitle );
                         
                        },
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: const Text(
                          "Month",
                        ),
                        onTap: () {
                         Provider.of<DbFunctionProvider>(context,listen: false).graphList=Provider.of<DbFunctionProvider>(context,listen: false).TransactionList.where((element) => 
                         element.dateTime.month==DateTime.now().month &&
                         element.dateTime.year==DateTime.now().year,).toList();
                      
                           value. dateFilterTitle = "Month";
                           Provider.of<statiticsDropDownProvider >(context,listen: false).changevalue(value.dateFilterTitle );
                         
                        },
                      ),
                    ],
                  );
                  },
                   
                ),
              ],
            ),
          ),

              SizedBox(height: size.height*0.02,),
             
             Expanded(child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                 child:Column(
                 children:<Widget> [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child:ButtonsTabBar(
                      backgroundColor: ButtonsTabBarcolor,
                      contentPadding: EdgeInsets.symmetric(horizontal:size.width*0.1),
                      tabs:const [
                        Tab(
                          iconMargin: EdgeInsets.all(30),
                          text: 'All',
                          
                        ),
                        Tab(
                          text: "Income",
                        ),
                        Tab(
                          text: "Expense",
                        ),

                      ]
                      ),
                  ),
                  Expanded(child: TabBarView(children: [
                    pichartAll(),
                   pichartIncome(),
                   pichartExpense(),
                  ]))
                 ],

                 )
                 ))
          
          
            
          
          
          
          
          
             
            ],
          
          ),

    
             


      )
      );
  }
}