

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walletwizard/model/add_datamodel.dart';

ValueNotifier<List<add_dataModel>>AddListNotifier=ValueNotifier([]);

Future<void> onTapTransactionAdd(add_dataModel value)async{
 

   final addTransactionList_db=await Hive.openBox<add_dataModel>('addList_db');
        await addTransactionList_db.put(value.id,value);
        getAllTransactions();
        //  AddListNotifier.value.add(value); 
        // AddListNotifier.notifyListeners();
} 



Future<void>getAllTransactions() async{
final addTransactionList_db=await Hive.openBox<add_dataModel>('addList_db');
AddListNotifier.value.clear();
AddListNotifier.value.addAll(addTransactionList_db.values);
    AddListNotifier.notifyListeners();
}


Future<void>updateTransaction(add_dataModel update)async{
  final addTransaction_db= await Hive.openBox<add_dataModel>('addList_db');
  addTransaction_db.put(update.id,update);
  // AddListNotifier.value[updation.id]=updation;
  AddListNotifier.notifyListeners();
  getAllTransactions();

}



//utility

int totals=0;
final box=Hive.box<add_dataModel>('addList_db');
int total(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].moneytype=='Income'
    ? int.parse(history2[i].Amount)
    : int.parse(history2[i].Amount)* -1 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}





int income(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].moneytype=='Income'
    ? int.parse(history2[i].Amount):0 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}



int expense(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].moneytype=='Income'? 0:int.parse(history2[i].Amount)* -1 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}