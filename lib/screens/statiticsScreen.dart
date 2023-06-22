import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class statiticsScreen extends StatefulWidget {
  const statiticsScreen({super.key});

  @override
  State<statiticsScreen> createState() => _statiticsScreenState();
}

class _statiticsScreenState extends State<statiticsScreen> {
 String dateFilterTitle = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Statitics',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
           flexibleSpace: Container(
      decoration: BoxDecoration(
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
              SizedBox(height: 20,),

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
                      // value: 1,
                      child: const Text(
                        "All",
                      ),
                      onTap: () {
                    


                        setState(() {
                          dateFilterTitle = "All";
                        });
                      },
                    ),
                    PopupMenuItem(
                      // value: 2,
                      child: const Text(
                        "Today",
                      ),
                      onTap: () {
                       









                        setState(() {
                          dateFilterTitle = "Today";
                        });
                      },
                    ),
                    PopupMenuItem(
                      // value: 2,
                      child: const Text(
                        "Yesterday",
                      ),
                      onTap: () {
                        
                        







                        setState(() {
                          dateFilterTitle = "Yesterday";
                        });
                      },
                    ),
                    PopupMenuItem(
                      // value: 2,
                      child: const Text(
                        "Month",
                      ),
                      onTap: () {
                   
                   










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

              SizedBox(height: 20,),
             
             Expanded(child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                 child:Column(
                 children:<Widget> [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child:ButtonsTabBar(
                      backgroundColor: Color(0xffa58fd2),
                      contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      tabs:[
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
                    Text('All'),
                    Text('Income'),
                 Text('Expense'),
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