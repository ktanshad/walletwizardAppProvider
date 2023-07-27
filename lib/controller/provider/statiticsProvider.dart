

import 'package:flutter/material.dart';

class statiticsDropDownProvider extends ChangeNotifier{

    String dateFilterTitle = "All";

  void changevalue(String? value){
      dateFilterTitle=value!;
     notifyListeners();

  }




}