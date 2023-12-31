


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';

import '../../model/add_datamodel.dart';
import '../editTransactionScreen/editTransactionScreen.dart';

class Search extends SearchDelegate{
   final String username;

   Search({required this.username});

  
  @override
  List<Widget>? buildActions(BuildContext context) {
     return <Widget>[
      IconButton(
        onPressed: (() {
          query = "";
        }),
        icon: const Icon(Icons.cancel_rounded),
      )
    ];
    
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
       return IconButton(
      onPressed: (() {
        close(context, query);
      }),
      icon: const Icon(Icons.arrow_back),
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
   return  Consumer<DbFunctionProvider>(
    builder: (context, value, child) {
      return  (value.TransactionList.isEmpty)
     ? const Center(
         child: Text('No data found'),
     )
     :CustomScrollView(
       slivers: [
          SliverList(
       delegate: SliverChildBuilderDelegate(
         (context, index) {
             final data = value.TransactionList.reversed.toList()[index];
             if(data.explain.toLowerCase().contains(query.toLowerCase()) 
             ||data.Amount.toLowerCase().contains(query.toLowerCase())
             || data.moneytype.toLowerCase().contains(query.toLowerCase())
             || data.CategoryItem.toLowerCase().contains(query.toLowerCase())      
             ){
                 return Slidable(
             endActionPane: ActionPane(
               motion: const BehindMotion(),
              children:[
               // SlidableAction(
               //   onPressed: (indext){
               //     setState(() {
               //       getAllTransactions();
               //       data.delete();
               //       total();
               //       income();
               //       expense();
               //     });
               //    },
               //    icon: Icons.delete,backgroundColor: Colors.red,
   
               //    ),
   
                   SlidableAction(
                 onPressed: (indext){   
                    Navigator.of(context).push(MaterialPageRoute(builder:((context) => editTransactionScreen(
                     //  index_: index,
                     username:username,
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
                   'asset/imagesCategory/${data.CategoryItem}.png',
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
             }else{
                const Text('no data found',style: TextStyle(color: Colors.black),);
             return const SizedBox();
             }
         
         },
         childCount:value.TransactionList.length,
       ),
     ),
       ],
     );
    },
     
   );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
        return  Consumer<DbFunctionProvider>(
          builder: (context, value, child) {
            return            (value.TransactionList.isEmpty)
          ? Center(child: Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png'))
          :CustomScrollView(
            slivers: [
               SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                  final data = value.TransactionList.reversed.toList()[index];
                  if(data.explain.toLowerCase().contains(query.toLowerCase()) 
                  || data.Amount.toLowerCase().contains(query.toLowerCase())
                  || data.moneytype.toLowerCase().contains(query.toLowerCase())
                  || data.CategoryItem.toLowerCase().contains(query.toLowerCase())
                  ){
                      return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                   children:[
                    // SlidableAction(
                    //   onPressed: (indext){
                    //     setState(() {
                    //       getAllTransactions();
                    //       data.delete();
                    //       total();
                    //       income();
                    //       expense();
                    //     });
                    //    },
                    //    icon: Icons.delete,backgroundColor: Colors.red,
        
                    //    ),
        
                        SlidableAction(
                      onPressed: (indext){   
                         Navigator.of(context).push(MaterialPageRoute(builder:((context) => editTransactionScreen(
                          //  index_: index,
                          username: username,
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
                        'asset/imagesCategory/${data.CategoryItem}.png',
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
                  }else{
                  return const SizedBox();
                  }
              
              },
              childCount:value.TransactionList.length,
            ),
          ),
            ],
          );
          },

        );
  }
  }





