import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/constants/colors.dart';
import 'package:walletwizard/View/Transactionhistorypage/transactionHistory.dart';
import 'package:walletwizard/Widget/drawClip.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import 'package:walletwizard/controller/provider/utilityProvider.dart';
import '../../model/add_datamodel.dart';

class homeScreen extends StatefulWidget {
  String username;
   homeScreen({super.key,
  required this.username
  });

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DbFunctionProvider>(context,listen: false).getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: Drawclip2(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                      gradient: Drawclip2color),
                ),
              ),
              ClipPath(
                clipper: Drawclip(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration:  BoxDecoration(
                      gradient: Drawclipcolor),
                ),
              ),
              Center(
                child: Consumer(
                  builder:(context, value, child) {
                    return             Column(
                    children: [
                      SizedBox(height: size.height*0.02,),
                      Text('Hello ${widget.username}',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height*0.02),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        height: size.height/4,
                        width: size.width*0.8,
                        child: Column(
                          children: [
                            SizedBox(height: size.height*0.02,),
                            Text(
                              'Total Balance',
                              style: GoogleFonts.ubuntu(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height*0.01,),
                            Text(
                              '₹${UtilityProvider().total()}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.height*0.06,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                            
                                Text('Income',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    Text('Expense',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(height: size.height*0.01),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text('₹${UtilityProvider().income()}',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('₹${UtilityProvider().expense()}',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                  }, 
       
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text('Recent Transactions',
                    style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) =>
                            transactionHistoryScreen(username: widget.username,))));
                  },
                  child: Text('see all',
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
          Expanded(
            child: (Provider.of<DbFunctionProvider>(context).TransactionList.isEmpty)
            ? Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png',)
            :CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final data = Provider.of<DbFunctionProvider>(context).TransactionList.reversed.toList()[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'asset/imagesCategory/${data.CategoryItem}.png',
                          height: size.height*0.06,
                        ),
                      ),
                      title: Text(
                        '${data.dateTime.day}/${data.dateTime.month}/${data.dateTime.year}',
                        style: GoogleFonts.ubuntu(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        data.explain,
                        style: GoogleFonts.ubuntu(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '₹${data.Amount}',
                        style: GoogleFonts.ubuntu(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: data.moneytype == 'Income'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    );
                  },
                      childCount:
                          Provider.of<DbFunctionProvider>(context).TransactionList.length > 4 ? 4 : Provider.of<DbFunctionProvider>(context).TransactionList.length),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


