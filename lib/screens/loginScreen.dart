import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletwizard/bottomNavigationBar/bottomNavigationBar.dart';

import '../main.dart';

final _usernameController = TextEditingController();

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: Drawclip2(),
                    child: Container(
                      width:size.width,
                      height: size.height*0.8,
                      decoration:const BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xffa58fd2),Color(0xffddc3fc)],
                        begin:Alignment.bottomCenter, 
                        end: Alignment.bottomRight )),
                    ),
                  ),
    
                      ClipPath(
                        clipper: Drawclip(),
                         child: Container(
                                         width:size.width,
                                         height: size.height*0.8,
                                         decoration:const BoxDecoration(
                                           gradient: LinearGradient(colors: [Color(0xffddc3fc),Color(0xff91c5fc)],
                                           begin:Alignment.topLeft, 
                                           end: Alignment.bottomRight )),
                                       ),
                       ),
    
    
    
    
                Center(
                  child: Column(
                          
                  
                    children: [
                      SizedBox(height: size.height*0.05,),
                       Image.asset('asset/loginimage/loginIcon.png',),
                       SizedBox(height: size.height*0.05,),
                      Form(
                        key: _formkey,
                        child:SizedBox(
                          width:size.width*0.6,
                          child: TextFormField(
                            
                            controller: _usernameController,
                            // obscureText: true,
                           decoration: InputDecoration(
                          
                          border: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                          hintText: "Username"
                           ),
                           validator:(value) {
                                    if(value==null || value.isEmpty){
                                       return 'Enter Username';
                                        }else{
                                         return null;
                                          }
                                          },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height*0.05,),
                            OutlinedButton(onPressed: (){
                                    if(_formkey.currentState!.validate()){
                                      checkLogin(context);
                             
                            }else{
                              print('empty value');
                            }
                        
                          },
                           style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 176, 146, 237)),
                             minimumSize: MaterialStateProperty.all<Size>(const Size(120, 35)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder( borderRadius: BorderRadius.circular(30),
                                 side: BorderSide.none),
                                 
                  ),
                             
                   ),
                           child:Text('Next',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white) ,)
                           )
                    ],
                  ),
                ),
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }


 void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final sharedPref = await SharedPreferences.getInstance();
     await sharedPref.setString('username', username);
     await sharedPref.setBool(SAVE_KEY_NAME,true);
        
     Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx1) => bottumNavigationpage(username: username,)));
      
  }




}


class Drawclip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
       Path path = Path();
       path.lineTo(0,size.height*0.80);
       path.cubicTo(size.width/4,size.height,3*size.width/4,size.height/2,size.width,size.height*0.8);
       path.lineTo(size.width,0);
       return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class Drawclip2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
       Path path = Path();
       path.lineTo(0,size.height*0.80);
       path.cubicTo(size.width/4,size.height,3*size.width/4,size.height/2,size.width,size.height*0.9);
       path.lineTo(size.width,0);
       return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}