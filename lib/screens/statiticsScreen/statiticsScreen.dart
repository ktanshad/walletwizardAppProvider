import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/db/functions/db_functions.dart';
import 'package:walletwizard/screens/statiticsScreen/pichartAll.dart';
import 'package:walletwizard/screens/statiticsScreen/pichartExpense.dart';
import 'package:walletwizard/screens/statiticsScreen/pichartIncome.dart';

import '../../model/add_datamodel.dart';

ValueNotifier<List<add_dataModel>>graphNotifier=ValueNotifier([]);

class statiticsScreen extends StatefulWidget {
  const statiticsScreen({super.key});

  @override
  State<statiticsScreen> createState() => _statiticsScreenState();
}

class _statiticsScreenState extends State<statiticsScreen> {
 String dateFilterTitle = "All";

 @override
  void initState() {
    super.initState();
    graphNotifier.value=AddListNotifier.value;
  }

  
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Statitics',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
           flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffa58fd2),
            Color(0xffddc3fc),
          ],
        ),
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
                PopupMenuButton<int>(
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
                          dateFilterTitle,
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
                      graphNotifier.value=AddListNotifier.value;


                        setState(() {
                          dateFilterTitle = "All";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Today",
                      ),
                      onTap: () {
                       graphNotifier.value=AddListNotifier.value.where((element) => 
                       element.dateTime.day==DateTime.now().day &&
                       element.dateTime.year==DateTime.now().year ,).toList();

                          setState(() {
                          dateFilterTitle = "Today";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Yesterday",
                      ),
                      onTap: () {
                      graphNotifier.value=AddListNotifier.value.where((element) => 
                      element.dateTime.day==DateTime.now().day-1 &&
                      element.dateTime.month==DateTime.now().month &&
                      element.dateTime.year==DateTime.now().year,).toList();
                        
                        setState(() {
                          dateFilterTitle = "Yesterday";
                        });
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text(
                        "Month",
                      ),
                      onTap: () {
                       graphNotifier.value=AddListNotifier.value.where((element) => 
                       element.dateTime.month==DateTime.now().month &&
                       element.dateTime.year==DateTime.now().year,).toList();
                    setState(() {
                          dateFilterTitle = "Month";
                        });
                      },
                    ),
                  ],
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
                      backgroundColor: const Color(0xffa58fd2),
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
                    const pichartIncome(),
                     const pichartExpense(),
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