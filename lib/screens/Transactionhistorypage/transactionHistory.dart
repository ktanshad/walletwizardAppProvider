import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/screens/Transactionhistorypage/search.dart';
import 'ExpenseTransactionView.dart';
import 'IncomeTransactionView.dart';
import 'allTransactionview.dart';

class transactionHistoryScreen extends StatefulWidget {
  String username;
  transactionHistoryScreen({super.key,
  required this.username});

  @override
  State<transactionHistoryScreen> createState() => _transactionHistoryScreenState();
}

class _transactionHistoryScreenState extends State<transactionHistoryScreen> {

TextEditingController searchController=TextEditingController();




  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
             appBar: AppBar(
            title: Center(child: Text('Transaction History',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
            actions: [
              IconButton(
                onPressed:(){
                 showSearch(context: context,
                  delegate:Search(username: widget.username),
                 );
                } , 
                icon: const Icon(Icons.search)
                )
            ],
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
            
            body: Container(
              child: Column(

             children: [
              
     
              SizedBox(height: size.height*0.03,),
              Expanded(child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                 child:Column(
                 children:<Widget> [
                  ButtonsTabBar(
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
                  Expanded(child: TabBarView(children: [
                     AllTransactionView (username: widget.username,),
                    IncomeTransactionView(username: widget.username,),
                    ExpenseTransactionView(username: widget.username,)
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









                
                
                        