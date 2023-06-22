import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../db/functions/db_functions.dart';
import '../../model/add_datamodel.dart';
import '../editTransactionScreen.dart';

class ExpenseTransactionView extends StatefulWidget {
  const ExpenseTransactionView({super.key});

  @override
  State<ExpenseTransactionView> createState() => _ExpenseTransactionViewState();
}

class _ExpenseTransactionViewState extends State<ExpenseTransactionView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AddListNotifier,
      builder: (BuildContext ctx, List<add_dataModel> addList, Widget? child) {
         var ExpenseList=addList.where((element) => element.moneytype=='Expense',).toList();

        return CustomScrollView(
          slivers: [
             SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
                final data = ExpenseList.reversed.toList()[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                 children:[
                  SlidableAction(
                    onPressed: (indext){
                      setState(() {
                        getAllTransactions();
                        data.delete();
                        total();
                        income();
                        expense();
                      });
                     },
                     icon: Icons.delete,backgroundColor: Colors.red,

                     ),

                      SlidableAction(
                    onPressed: (indext){   
                       Navigator.of(context).push(MaterialPageRoute(builder:((context) => editTransactionScreen(
                        //  index_: index,
                        id_: data.id,
                         amount_: data.Amount,
                         categoryItem_: data.CategoryItem,
                         explain_: data.explain,
                         moneyType_: data.moneytype,
                         date_: data.dateTime,

                       ))));

                   
                     },
                     icon: Icons.edit,backgroundColor: Colors.blue,
                     
                    

                  )
                 ]),
                
                child: ListTile(
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
                ),
              );
            },
            childCount: ExpenseList.length,
          ),
        ),
          ],
        );
      },
    );
  }
}