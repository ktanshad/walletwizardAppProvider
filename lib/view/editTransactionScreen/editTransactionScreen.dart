
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/Constants/colors.dart';
import 'package:walletwizard/Constants/itemList.dart';
import 'package:walletwizard/controller/provider/addTransactionProvider.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import 'package:walletwizard/view/Transactionhistorypage/transactionHistory.dart';
import 'package:walletwizard/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:walletwizard/model/add_datamodel.dart';


class editTransactionScreen extends StatefulWidget {
    // int index_;
    String username;
  String id_;
  var amount_;
  var explain_;
  var categoryItem_;
  var moneyType_;
  var date_;
   editTransactionScreen({
    super.key,
  // required this.index_,
  required this.username,
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


  // DateTime date=DateTime.now();
  // String?Selectedmoneytype;
  //  String?SelectedCategoryItem;
   var _AmountController =TextEditingController();
   var _explainController =TextEditingController();
    final _formkey = GlobalKey<FormState>();

@override
  void initState() {
    super.initState();

    _AmountController =TextEditingController(text:widget.amount_);
    _explainController =TextEditingController(text:widget.explain_);
      Provider.of<addTransactionDropDownProvider>(context,listen: false). SelectedCategoryItem=widget.categoryItem_;
   Provider.of<addTransactionDropDownProvider>(context,listen: false).Selectedmoneytype=widget.moneyType_;
   Provider.of<addTransactionDropDownProvider>(context,listen: false).date=widget.date_;
  
    
  }



  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          
          height: 800,
        decoration: BoxDecoration(gradient: TransactionScreenbackgroundcolor,),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key:_formkey,
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Center(child: Text("Edit Transaction",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),)),
                 const SizedBox(height: 30,),
                  
                  
                 Container(
                  decoration: BoxDecoration(
                      color: TransactionScreenContainercolor,
                    borderRadius: BorderRadiusDirectional.circular(30)),
                   height:size.height*0.6,
                   width: size.width*0.8,
                  
                   child: Center(
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          
                        
                        Container(
                         padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                         
                          width:size.width*0.6,
                          height: size.height*0.07,
                         
                         decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30) ,
                           color: Colors.white,
                         ),
                        child: Consumer<addTransactionDropDownProvider>(
                          builder: (context, value, child) {
                            return  DropdownButton<String>(
                                        value: value.Selectedmoneytype,
                                        items: moneytypelist.map((e) => DropdownMenuItem(
                                          child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          child: Image.asset('asset/imagesMoneyType/$e.png'),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(e, style: const TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                          ),
                                          value: e,
                                        )).toList(),
                                        selectedItemBuilder: (BuildContext context) =>
                                        moneytypelist.map((e) => Row(
                                          children: [
                                    SizedBox(
                                      width: 42,
                                      child: Image.asset('asset/imagesMoneyType/$e.png'),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text(e, style: const TextStyle(fontSize: 18)),
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
                                         Provider.of<addTransactionDropDownProvider>(context,listen: false).changeMoneyTypevalue(value);
                                        },
                                      );
                          },
                        
                        ),
                        ),
                  
            
                  
                  
                        Container(
                         padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                         
                          width:size.width*0.6,
                          height: size.height*0.07,
                         
                         decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30) ,
                           color: Colors.white,
                         ),
                           child:Consumer<addTransactionDropDownProvider>(
                            builder: (context, value, child) {
                              return   DropdownButton<String>(
                                                     value:value.SelectedCategoryItem,
                                                     items:categoryList.map((e) => DropdownMenuItem(
                              child: Row(
                                 children: [
                                   Container(
                                     width: 40,
                                     child: Image.asset('asset/imagesCategory/${e}.png'),
                                   ),
                                   const SizedBox(width: 10,),
                                   Text(e,style: const TextStyle(fontSize: 18),)
                                 ],
                               ),
                              value: e,)).toList(),
                              selectedItemBuilder: (BuildContext context)=>
                              categoryList.map((e) => Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      child:Image.asset('asset/imagesCategory/${e}.png'),
                                    ),
                                    const SizedBox(width: 10,),
                                     
                                    Text(e,style: const TextStyle(fontSize: 18),)
                                  ],
                                )).toList(),
                              
                              hint: Text('select category',style: GoogleFonts.ubuntu(fontSize: 15,fontWeight:FontWeight.bold,),),
                              dropdownColor: Colors.white,
                               borderRadius: BorderRadius.circular(30),
                              isExpanded: true,
                              underline: Container(),
                             onChanged:((value){
                                 Provider.of<addTransactionDropDownProvider>(context,listen: false).changeCtegoryItemValue(value);
                             })
                                                   );
                            },
                            
                           ),
                        ),
                  
                  
                  
                  
                        SizedBox(
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
                  
                  
                  
                  
                        SizedBox(
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
                              const SizedBox(width: 5,),
                              Consumer<addTransactionDropDownProvider>(
                                builder: (context, value, child) {
                                  return  TextButton(onPressed: ()async{
                                  DateTime? newDate =await showDatePicker(context: context, initialDate:value.date, firstDate:DateTime(2023), lastDate:DateTime(2100));
                                  if(newDate==Null)return;
                                    value.changeDateValue(newDate!);
                                },
                                 child:Text('Date:${value.date.day}/${value.date.month}/ ${value.date.year}',style: const TextStyle(color:Colors.black),),);
                                },
                              
                              ),
                            ],
                          ),
                        ),
                  
                       )
                  
                      ],
                     ),
                   ),
                  ),
          
                  const SizedBox(height: 20,),
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
                         backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 144, 106, 220)),
                         minimumSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
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
    final _categoryItem =Provider.of<addTransactionDropDownProvider>(context,listen: false).SelectedCategoryItem;
    final _moneytype = Provider.of<addTransactionDropDownProvider>(context,listen: false).Selectedmoneytype;
    final _date=Provider.of<addTransactionDropDownProvider>(context,listen: false).date;
    final _id=widget.id_;
  
    if(_categoryItem!.isEmpty ||
    _moneytype!.isEmpty || _Amount.isEmpty||_explain.isEmpty){
      return;
    }
     if(_formkey.currentState!.validate()){
    final updation=add_dataModel(_moneytype, _categoryItem, _Amount, _explain,_date,_id);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>transactionHistoryScreen(username: widget.username,)));
    // updateTransaction( updation);
    Provider.of<DbFunctionProvider>(context,listen: false).updateTransaction(updation);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    content: Text('UPDATED'),));
     }else{
      print('value empty');
     }
  }
}