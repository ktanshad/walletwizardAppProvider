import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:walletwizard/screens/settings_Screen/aboutScreen.dart';
import 'package:walletwizard/screens/settings_Screen/privacyScreen.dart';
import 'package:walletwizard/screens/settings_Screen/settings_functions.dart';
import 'package:walletwizard/screens/settings_Screen/terms&conditionScreen.dart';


class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
         appBar: AppBar(
          title: Center(child: Text('Settings',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
           flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffa58fd2),
            Color(0xffddc3fc),
          ],
        ),
      ),
    ),
          
          ),


          body:Column(
            children: [
              SizedBox(height: size.height*0.04,),
              GestureDetector(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AboutScreen()));},
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Image.asset('asset/settings icons/about_icon.png',height: 40,width: 40,),
              
                    const SizedBox(width: 50,),
                
                  Text('About',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),


               SizedBox(height: size.height*0.04,),
              GestureDetector(
                onTap:(){
                  resetApp(context);
                },
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Image.asset('asset/settings icons/reset_icon.png',height: 40,width:40),
              
                    const SizedBox(width: 50,),
                
                  Text('Reset',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),


                SizedBox(height: size.height*0.04),
              GestureDetector(
                onTap: (){
                  Share.share("Hey!check out this new app....walletwizard");
                },
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Image.asset('asset/settings icons/share_icon.png',height: 40,width: 40,),
              
                    const SizedBox(width: 50,),
                
                  Text('Share',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),



                     SizedBox(height: size.height*0.04),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const termsScreen()));
                },
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Image.asset('asset/settings icons/terms_icon.png',height: 40,width: 40,),
              
                    const SizedBox(width: 50,),
                
                  Text('Terms & Conditions',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),

                           SizedBox(height: size.height*0.04,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const privacyPolicyScreen()));
                },
                child: Row(
                  children: [
                    const SizedBox(width: 20,),
                    Image.asset('asset/settings icons/privacy_icon.png',height: 40,width: 40,),
              
                    const SizedBox(width: 50,),
                
                  Text('Privacy Policy',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),


              
            ],
          ),
    );
  }




}