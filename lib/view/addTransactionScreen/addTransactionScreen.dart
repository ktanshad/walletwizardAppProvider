
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walletwizard/constants/colors.dart';
import 'package:walletwizard/constants/itemList.dart';
import 'package:walletwizard/controller/provider/addTransactionProvider.dart';
import 'package:walletwizard/controller/provider/dbFunctionsProvider.dart';
import 'package:walletwizard/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:walletwizard/model/add_datamodel.dart';



class AddTransactionScreen extends StatefulWidget {
  String username;
   AddTransactionScreen({super.key,
  required this.username});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<addTransactionDropDownProvider>(context,listen: false).resetCategoryItem();
    Provider.of<addTransactionDropDownProvider>(context,listen: false).resetMoneyType();
    Provider.of<addTransactionDropDownProvider>(context,listen: false).resetdate();
  }


  // DateTime date=DateTime.now();
  // String?Selectedmoneytype;
  //  String?SelectedCategoryItem;
   final _AmountController =TextEditingController();
   final _explainController =TextEditingController();

    final _formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          
          child: Container(
            
            height: size.height,
          decoration: BoxDecoration(gradient: TransactionScreenbackgroundcolor,),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key:_formkey,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Center(child: Text("Add Transaction",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),)),
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
                              return DropdownButton<String>(
                                            value: value.Selectedmoneytype,
                                            items: moneytypelist.map((e) => DropdownMenuItem(
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
                                             Provider.of<addTransactionDropDownProvider>(context, listen: false).changeMoneyTypevalue(value);
                                        
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
                                return DropdownButton<String>(
                                                         value:value.SelectedCategoryItem,
                                                         items:categoryList.map((e) => DropdownMenuItem(
                                child: Row(
                                   children: [
                                     SizedBox(
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
                                      SizedBox(
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
                                     return 'please enter Amount';
                                      }else if(value.contains(',')){
                                         return 'Please remove special character';
                                      }else if(value.contains('.')){
                                         return 'Please remove special character';
                                      }else if(value.contains(' ')){
                                        return 'Please Enter a valid number';
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
                                    return TextButton(onPressed: ()async{
                                    DateTime? newDate =await showDatePicker(context: context, initialDate:value.date, firstDate:DateTime(2023), lastDate:DateTime(2100));
                                    if(newDate==Null)return;
                                     value.changeDateValue(newDate!);
                                  },
                                   child:Text('Date:${value.date.day}/${value.date.month}/ ${value.date.year}',style: TextStyle(color:Colors.black),),);
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
                          onSaveButtonClicked();
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
      ),
    );
  }


  Future<void>onSaveButtonClicked()async{
   final _Amount= _AmountController.text.trim();
   final _explain=_explainController.text.trim();
    final _categoryItem =Provider.of<addTransactionDropDownProvider>(context,listen: false).SelectedCategoryItem;
    final _moneytype = Provider.of<addTransactionDropDownProvider>(context,listen: false).Selectedmoneytype;
    final _date=Provider.of<addTransactionDropDownProvider>(context,listen: false).date;
     final _id= DateTime.now().microsecondsSinceEpoch.toString();
  
    if(_categoryItem!.isEmpty ||
    _moneytype!.isEmpty || _Amount.isEmpty||_explain.isEmpty){
      return;
    }
  
    final _tarnsactionAdd=add_dataModel(_moneytype, _categoryItem, _Amount, _explain,_date,_id);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>bottumNavigationpage(username:widget.username ,)));
    // onTapTransactionAdd(_tarnsactionAdd);
    Provider.of<DbFunctionProvider>(context,listen: false).onTapTransactionAdd(_tarnsactionAdd);   
  }
}