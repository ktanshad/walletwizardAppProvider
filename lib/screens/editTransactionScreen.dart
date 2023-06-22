import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletwizard/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:walletwizard/model/add_datamodel.dart';
import 'package:walletwizard/screens/homeScreen.dart';

import '../db/functions/db_functions.dart';


class editTransactionScreen extends StatefulWidget {
    // int index_;
  String id_;
  var amount_;
  var explain_;
  var categoryItem_;
  var moneyType_;
  var date_;
   editTransactionScreen({
    super.key,
  // required this.index_,
  required this.id_,
  required this.amount_,
  required this.explain_,
  required this.categoryItem_,
  required this.moneyType_,
  required this.date_,
  });

  @override
  State<editTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<editTransactionScreen> {


  DateTime date=DateTime.now();
  String?Selectedmoneytype;
   String?SelectedCategoryItem;
   var _AmountController =TextEditingController();
   var _explainController =TextEditingController();




    final _formkey = GlobalKey<FormState>();


 final List<String> _categoryList=[
  'Salary',
  'Food',
  'Travel',
  'Education',
  'Gift',
  'Maintenance',
  'Other'
 ];


final List<String> _moneytypelist=[
  'Income',
  'Expense'
 ];


@override
  void initState() {
    super.initState();

    _AmountController =TextEditingController(text:widget.amount_);
    _explainController =TextEditingController(text:widget.explain_);
   SelectedCategoryItem=widget.categoryItem_;
   Selectedmoneytype=widget.moneyType_;
   date=widget.date_;
  
    
  }

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          
          height: 800,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 165, 143, 210),Color(0xffddc3fc), ],),),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key:_formkey,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(child: Text("Edit Transaction",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),)),
                 SizedBox(height: 30,),
                  
                  
                 Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 144, 106, 220),
                    borderRadius: BorderRadiusDirectional.circular(30)),
                   height:size.height*0.6,
                   width: size.width*0.8,
                  
                   child: Center(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          
                        
                        Container(
                         padding: EdgeInsets.symmetric(horizontal:15,vertical: 10),
                         
                          width:size.width*0.6,
                          height: size.height*0.07,
                         
                         decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30) ,
                           color: Colors.white,
                         ),
                        child: DropdownButton<String>(
                value: Selectedmoneytype,
                items: _moneytypelist.map((e) => DropdownMenuItem(
                  child: Container(
            child: Row(
              children: [
                Container(
                  width: 40,
                  child: Image.asset('imagesMoneyType/$e.png'),
                ),
                SizedBox(width: 10,),
                Text(e, style: TextStyle(fontSize: 18)),
              ],
            ),
                  ),
                  value: e,
                )).toList(),
                selectedItemBuilder: (BuildContext context) =>
                _moneytypelist.map((e) => Row(
                  children: [
            Container(
              width: 42,
              child: Image.asset('imagesMoneyType/$e.png'),
            ),
            SizedBox(width: 10,),
            Text(e, style: TextStyle(fontSize: 18)),
                  ],
                )).toList(),
                hint: Text(
                  'Select',
                  style: GoogleFonts.ubuntu(
            fontSize: 15,
            fontWeight: FontWeight.bold,
                  ),
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(30),
                isExpanded: true,
                underline: Container(),
                onChanged: (value) {
                  setState(() {
            Selectedmoneytype = value;
                  });
                },
              ),
                        ),
                  
            
                  
                  
                        Container(
                         padding: EdgeInsets.symmetric(horizontal:15,vertical: 10),
                         
                          width:size.width*0.6,
                          height: size.height*0.07,
                         
                         decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30) ,
                           color: Colors.white,
                         ),
                           child:DropdownButton<String>(
                          value:SelectedCategoryItem,
                          items:_categoryList.map((e) => DropdownMenuItem(
                            child: Container(
                             child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: Image.asset('imagesCategory/${e}.png'),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(e,style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                            value: e,)).toList(),
                            selectedItemBuilder: (BuildContext context)=>
                            _categoryList.map((e) => Row(
                                children: [
                                  Container(
                                    width: 42,
                                    child:Image.asset('imagesCategory/${e}.png'),
                                  ),
                                  SizedBox(width: 10,),
          
                                  Text(e,style: TextStyle(fontSize: 18),)
                                ],
                              )).toList(),
                            
                            hint: Text('select category',style: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold,),),
                            dropdownColor: Colors.white,
                             borderRadius: BorderRadius.circular(30),
                            isExpanded: true,
                            underline: Container(),
                           onChanged:((value){
                            setState(() {
                              SelectedCategoryItem=value!;
                            });
                           })
                        ),
                        ),
                  
                  
                  
                  
                        Container(
                          width:size.width*0.6,
                          child: TextFormField(
                            controller: _AmountController,
                             validator: (value) {
                                if(value==null || value.isEmpty){
                                   return 'please enter value';
                                    }else{
                                     return null;
                                      }
                                      },
                          //       inputFormatters: [
                          // FilteringTextInputFormatter.allow(RegExp(r'/d+')), // Only allow digits
                          //      ],
                              keyboardType: TextInputType.number,    
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText:"Amount",
                              hintStyle: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold), 
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                  
                  
                  
                  
                        Container(
                          width:size.width*0.6,
                          child: TextFormField(
                            controller: _explainController,
                             validator: (value) {
                                if(value==null || value.isEmpty){
                                   return 'value is empty';
                                    }else{
                                     return null;
                                      }
                                      },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                                hintText:"explain",
                              hintStyle: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold), 
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                  
                  
                             Container(
                              alignment: Alignment.bottomLeft,
                          width:size.width*0.6,
                           height: size.height*0.07,
                         
                         decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30) ,
                           color: Colors.white,
                         ),
          
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              TextButton(onPressed: ()async{
                                DateTime? newDate =await showDatePicker(context: context, initialDate:date, firstDate:DateTime(2023), lastDate:DateTime(2100));
                                if(newDate==Null)return;
                                setState(() {
                                  date=newDate!;
                                });
                              },
                               child:Text('Date:${date.day}/${date.month}/ ${date.year}',style: TextStyle(color:Colors.black),),),
                            ],
                          ),
                        ),
                  
                       )
                  
                      ],
                     ),
                   ),
                  ),
          
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(onPressed: (){
                       onSaveUpadteButtonClicked();
                           if(_formkey.currentState!.validate()){
                        }else{
                          print('empty value');
                        }
                    
                      },
                      
                        style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 144, 106, 220)),
                         minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                             RoundedRectangleBorder( borderRadius: BorderRadius.circular(30),
                             side: BorderSide.none),
                             
              ),
                         
               ),
                       child:Text('save',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white) ,)
                       )
                    ],
                  )
          
                  
                  
                 ],
                 ),
          ),
        ),


        
          
          
    
    
    
    
    
        ),
      ),
    );
  }


  Future<void>onSaveUpadteButtonClicked()async{
   final _Amount= _AmountController.text.trim();
   final _explain=_explainController.text.trim();
    final _categoryItem =SelectedCategoryItem;
    final _moneytype = Selectedmoneytype;
    final _date=date;
    final _id=widget.id_;
  
    if(_categoryItem!.isEmpty ||
    _moneytype!.isEmpty || _Amount.isEmpty||_explain.isEmpty){
      return;
    }
     if(_formkey.currentState!.validate()){
    final updation=add_dataModel(_moneytype, _categoryItem, _Amount, _explain,_date,_id);
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>bottumNavigationpage()));
    updateTransaction( updation);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    content: Text('UPDATED'),));
     }else{
      print('value empty');
     }
  }
}