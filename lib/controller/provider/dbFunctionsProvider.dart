

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walletwizard/model/add_datamodel.dart';


const transactionDBName= 'addList_db';

class DbFunctionProvider extends ChangeNotifier{



List<add_dataModel>TransactionList=[];
List<add_dataModel>graphList=[];

  // get isEmpty => null;



Future<void> onTapTransactionAdd(add_dataModel value)async{
 

   final addTransactionList_db=await Hive.openBox<add_dataModel>(transactionDBName);
        await addTransactionList_db.put(value.id,value);
        getAllTransactions();
        notifyListeners();
        //  AddListNotifier.value.add(value); 
        // AddListNotifier.notifyListeners();
} 



Future<void>getAllTransactions() async{
final addTransactionList_db=await Hive.openBox<add_dataModel>(transactionDBName);
TransactionList.clear();
TransactionList=addTransactionList_db.values.toList();
     notifyListeners();
}

Future<void> deleteTransaction(String id) async {
    final addTransaction_db = await Hive.openBox<add_dataModel>(transactionDBName);
   addTransaction_db.delete(id);
   notifyListeners();
   getAllTransactions();
  }


Future<void>updateTransaction(add_dataModel update)async{
  final addTransaction_db= await Hive.openBox<add_dataModel>(transactionDBName);
  addTransaction_db.put(update.id,update);
  // AddListNotifier.value[updation.id]=updation;
  notifyListeners();
  getAllTransactions();

}







}





