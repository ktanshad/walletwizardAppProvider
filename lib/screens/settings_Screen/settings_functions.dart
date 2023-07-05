 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletwizard/db/functions/db_functions.dart';
import 'package:walletwizard/model/add_datamodel.dart';
import 'package:walletwizard/screens/loginScreen.dart';

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

                    AddListNotifier.value.clear();

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