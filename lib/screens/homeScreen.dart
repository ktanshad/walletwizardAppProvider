import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/screens/Transactionhistorypage/transactionHistory.dart';
import '../db/functions/db_functions.dart';
import '../model/add_datamodel.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

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
      child: ValueListenableBuilder(
          valueListenable: AddListNotifier,
          builder:
              (BuildContext ctx, List<add_dataModel> addList, Widget? child) {
            return Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: Drawclip2(),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
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
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffddc3fc), Color(0xff91c5fc)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text('Hello Anshad',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            height: 180,
                            width: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Total Balance',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    '₹${total()}',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'asset/homePageIcon/IncomeIcon.png',
                                                height: 60,
                                                width: 60,
                                              ),
                                              Text('Income',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 35),
                                            child: Row(
                                              children: [
                                                Text('Expense',
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Image.asset(
                                                  'asset/homePageIcon/ExpenseIcon.png',
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('₹${income()}',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text('₹${expense()}',
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
                                  transactionHistoryScreen())));
                        },
                        child: Text('see all',
                            style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )))
                  ],
                ),
                Expanded(
                  child: Container(
                    child: CustomScrollView(
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
                                  height: 40,
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
                    ),
                  ),
                ),
              ],
            );
          }),
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
