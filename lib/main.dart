import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/controller/provider/addTransactionProvider.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import 'package:walletwizard/controller/provider/statiticsProvider.dart';
import 'package:walletwizard/controller/provider/utilityProvider.dart';
import 'package:walletwizard/view/splashScreen/splashScreen.dart';
import 'package:walletwizard/model/add_datamodel.dart';


 const SAVE_KEY_NAME='UserLoggedIn';

Future<void> main() async{
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(adddataModelAdapter().typeId)){
  Hive.registerAdapter(adddataModelAdapter());
 }
 await Hive.openBox<add_dataModel>('addList_db');
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create:(BuildContext context) =>addTransactionDropDownProvider(), 
          ),

            ChangeNotifierProvider(
          create:(BuildContext context) =>statiticsDropDownProvider (), 
          ),

               ChangeNotifierProvider(
          create:(BuildContext context) =>DbFunctionProvider(), 
          ),

               ChangeNotifierProvider(
          create:(BuildContext context) =>UtilityProvider(), 
          ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen(),
      ),
    );
  }
}

