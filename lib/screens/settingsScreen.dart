import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Center(child: Text('Settings',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
           flexibleSpace: Container(
      decoration: BoxDecoration(
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
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset('asset/settings icons/about-13-128.png',height: 50,width: 50,),

                  SizedBox(width: 50,),
              
                Text('About',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                ],
              ),


               SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset('asset/settings icons/reset-8-128.png',height: 50,width: 50,),

                  SizedBox(width: 50,),
              
                Text('Reset',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                ],
              ),


                SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset('asset/settings icons/share-457-128.png',height: 50,width: 50,),

                  SizedBox(width: 50,),
              
                Text('Share',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                ],
              ),



                     SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset('asset/settings icons/terms-of-service-128.png',height: 50,width: 50,),

                  SizedBox(width: 50,),
              
                Text('Terms & Conditions',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                ],
              ),

                           SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset('asset/settings icons/privacy-17-128.png',height: 50,width: 50,),

                  SizedBox(width: 50,),
              
                Text('Privacy Policy',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))
                ],
              ),


              
            ],
          ),
    );
  }
}