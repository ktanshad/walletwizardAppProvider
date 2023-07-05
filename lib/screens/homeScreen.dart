import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/screens/Transactionhistorypage/transactionHistory.dart';
import '../db/functions/db_functions.dart';
import '../model/add_datamodel.dart';

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
  Widget build(BuildContext context) {
    getAllTransactions();
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
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.bottomRight)),
                ),
              ),
              ClipPath(
                clipper: Drawclip(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffddc3fc), Color(0xff91c5fc)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
              ),
              Center(
                child: Column(
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
                            '₹${IncomeAndExpence().total()}',
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
                              Text('₹${IncomeAndExpence().income()}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('₹${IncomeAndExpence().expense()}',
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
                    Navigator.of(context).push(MaterialPageRoute(
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
            child: ValueListenableBuilder(
              valueListenable: AddListNotifier,
             builder: (BuildContext ctx, List<add_dataModel> addList, Widget? child) {
              return (addList.isEmpty)
              ? Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png',)
              :CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final data = addList.reversed.toList()[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'imagesCategory/${data.CategoryItem}.png',
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
                            addList.length > 4 ? 4 : addList.length),
                  ),
                ],
              );
             }
            ),
          ),
        ],
      ),
    ));
  }
}

class Drawclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Drawclip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
