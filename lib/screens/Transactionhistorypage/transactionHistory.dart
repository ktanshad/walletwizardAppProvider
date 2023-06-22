import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/db/functions/db_functions.dart';
import 'package:walletwizard/screens/Transactionhistorypage/search.dart';
import 'package:walletwizard/screens/editTransactionScreen.dart';

import '../../model/add_datamodel.dart';
import 'ExpenseTransactionView.dart';
import 'IncomeTransactionView.dart';
import 'allTransactionview.dart';

class transactionHistoryScreen extends StatefulWidget {
  const transactionHistoryScreen({super.key});

  @override
  State<transactionHistoryScreen> createState() => _transactionHistoryScreenState();
}

class _transactionHistoryScreenState extends State<transactionHistoryScreen> {

TextEditingController searchController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
             appBar: AppBar(
            title: Center(child: Text('Transaction History',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
            actions: [
              IconButton(
                onPressed:(){
                 showSearch(context: context,
                  delegate:Search(),
                 );
                } , 
                icon: Icon(Icons.search)
                )
            ],
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
            
            body: Container(
              child: Column(

             children: [
              SizedBox(height: 20,),
              
              Container(
      width: 350,



      // child: TextField(
      //   controller: searchController,
      //   onChanged: (quary){
         

      //   },
      //   style: TextStyle(color:Colors.black),
      //   decoration: InputDecoration(
      //     filled: true,
      //     fillColor:Color.fromARGB(255, 242, 234, 234),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(8.0),
      //       borderSide: BorderSide.none,
      //     ),
      //     hintText: "Search",
      //     prefixIcon: Icon(Icons.search),
      //     prefixIconColor: Colors.blue,
      //     suffixIcon: IconButton(
      //       onPressed: (){},
      //      icon: Icon(Icons.cancel_sharp)
      //      )
      //   ),
      // ),
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
                     AllTransactionView (),
                    IncomeTransactionView(),
                    ExpenseTransactionView()
                  ]))
                 ],

                 )
                 ))
             ],









              
              ),
            ),  
             
          
      ),
    );
  }
}









                
                
                        