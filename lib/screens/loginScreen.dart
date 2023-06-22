import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

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
                      decoration:BoxDecoration(
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
                                         decoration:BoxDecoration(
                                           gradient: LinearGradient(colors: [Color(0xffddc3fc),Color(0xff91c5fc)],
                                           begin:Alignment.topLeft, 
                                           end: Alignment.bottomRight )),
                                       ),
                       ),
    
    
    
    
                Padding(
                  padding: const EdgeInsets.only(top:100,left: 140 ),
                  child: Column(
                    children: [
                      Text('Login',style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight:FontWeight.bold
                      ),
                      )
                    ],
                  ),
                )
    
    
    
                       
    
                ],
              )
            ],
          ),
        ),
      ),
    );
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