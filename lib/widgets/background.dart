import 'package:flutter/material.dart';
 class Background extends StatelessWidget {
   const Background({Key? key, required this.espec, required this.height}) : super(key: key);

   final String espec;
   final double height;

   @override
   Widget build(BuildContext context) {

     double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;

     Color prim = Colors.blue;
     Color sec = Colors.blueAccent;

     if (espec == "purple"){
        prim = Color(0xFF4268d3);
        sec = Color(0xFF584CD1);
     }

     return Container(
       width: screenWidth,
       height: height,
       decoration: BoxDecoration(
           gradient: LinearGradient(
             colors : [
               prim,
               sec
             ],
             begin: FractionalOffset(0.2,0.0),
             end: FractionalOffset(1.0,0.6),
             stops: [0.0,0.6],
             tileMode: TileMode.clamp,
           )
       ),
       child: FittedBox(
         fit: BoxFit.none,
         alignment: Alignment(-1.5, -0.8),
         child: Container(
           width: screenHeight,
           height: screenHeight,
           decoration: BoxDecoration(
             color: Color.fromRGBO(0, 0, 0, 0.05),
             borderRadius: BorderRadius.circular(
                 screenHeight/2
             ),
           ),
         ),
       ),
     );
   }
 }
