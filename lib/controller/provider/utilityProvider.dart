//utility


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/add_datamodel.dart';
import 'dbFunctionsProvider.dart';

int totals=0;
final box=Hive.box<add_dataModel>(transactionDBName);
class UtilityProvider extends ChangeNotifier{

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

}


