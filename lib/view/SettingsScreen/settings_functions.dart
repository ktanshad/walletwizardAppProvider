 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletwizard/model/add_datamodel.dart';
import 'package:walletwizard/view/loginScreen/loginScreen.dart';

import '../../controller/provider/dbFunctionsProvider.dart';


  resetApp(BuildContext context) {
    showDialog( 
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text(
              'Do you want to Reset the app?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: (() async {
                    Navigator.of(context).pop();

                    final transactionDb =
                        await Hive.openBox<add_dataModel>(transactionDBName);

                    transactionDb.clear();

                    Provider.of<DbFunctionProvider>(context,listen: false).TransactionList.clear();

                  clearSharedPreferences(ctx);
                    
                    // AddListNotifier.notifyListeners();

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const loginScreen(),
                      ),
                    );
                    

            
                  }),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          );
        });
  }

  void clearSharedPreferences(BuildContext ctx) async {
  final sharedPref = await SharedPreferences.getInstance();
  sharedPref.clear();
}