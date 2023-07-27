import 'package:flutter/material.dart';

class addTransactionDropDownProvider extends ChangeNotifier{
  String? Selectedmoneytype;
  String? SelectedCategoryItem;
  DateTime date = DateTime.now();
 
  
   void changeMoneyTypevalue(String? value){
        Selectedmoneytype=value;
        notifyListeners();
        }

   void changeCtegoryItemValue(String? value){
     SelectedCategoryItem=value;
    notifyListeners();
   }

   void changeDateValue(DateTime value){
     date=value;
    notifyListeners();
   }

    void resetMoneyType() {
    Selectedmoneytype = null;
  }

  void resetCategoryItem() {
    SelectedCategoryItem = null;

  }
  void resetdate() {
    date = DateTime.now();

  }
   
  


}