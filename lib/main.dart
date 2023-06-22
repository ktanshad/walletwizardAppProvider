import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walletwizard/model/add_datamodel.dart';
import 'package:walletwizard/screens/homeScreen.dart';
import 'package:walletwizard/screens/loginScreen.dart';

import 'bottomNavigationBar/bottomNavigationBar.dart';

Future<void> main() async{
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(adddataModelAdapter().typeId)){
  Hive.registerAdapter(adddataModelAdapter());
 }
 await Hive.openBox<add_dataModel>('addList_db');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:bottumNavigationpage(),
    );
  }
}

