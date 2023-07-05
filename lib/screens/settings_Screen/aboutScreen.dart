import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
       appBar: AppBar(
          title: Center(child: Text('About',style:GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,))),
          actions: [Image.asset('asset/settings icons/about_icon.png',color: Colors.white,height: 40,width: 40,)],
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
          body: Center(
            child: Column(
              children: [
                SizedBox(height:size.height*0.3,),
                const Text('WalletWizard',  style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height*0.06,),
                  const SizedBox(
                    height: 100,
                    width: 300,
                    child: Text('"This is an app where you can add your daily transactions according to the category which it belongs to."',
                      
                          style: TextStyle(fontSize: 17),),
                  ),
                  SizedBox(height: size.height*0.04,),
                   const Text(
                          'Developed by',
                          style: TextStyle(fontSize: 16),
                        ),
                         const Text(
                          'Anshad',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        )
              ],
            ),
          ),
    ));
  }
}