import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/constants/colors.dart';
import 'package:walletwizard/view/Transactionhistorypage/search.dart';
import 'package:walletwizard/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'expenseTransactionView.dart';
import 'IncomeTransactionView.dart';
import 'allTransactionview.dart';

class transactionHistoryScreen extends StatelessWidget {
  String username;
  transactionHistoryScreen({super.key,
  required this.username});

TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
             appBar: AppBar(
            leading:  GestureDetector(
              onTap:(){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) =>bottumNavigationpage(username:  username)));},
              child: Icon(Icons.arrow_back_outlined)),
            title: Center(child: Text('Transaction History',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
            actions: [
              IconButton(
                onPressed:(){
                 showSearch(context: context,
                  delegate:Search(username: username),
                 );
                } , 
                icon: const Icon(Icons.search)
                )
            ],
            
             flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient:appbarcolor,
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
                  Expanded(child: TabBarView(children: [
                     AllTransactionView (username: username,),
                    IncomeTransactionView(username: username,),
                    ExpenseTransactionView(username: username,)
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









                
                
                        