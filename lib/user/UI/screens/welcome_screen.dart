import 'package:flutter/material.dart';
import 'package:realplaza_evacuacion_app/evacuation_map/UI/screens/map.dart';
import 'package:realplaza_evacuacion_app/widgets/background.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Background(
              height: double.infinity,
              espec: "nothing",
            ),
            Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: EdgeInsets.only(left:15,right: 15),
                 child: Container(
                   height: 250,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage(
                         "assets/Icons/logoRealPlaza.png",
                       ),
                       fit: BoxFit.fill
                     )
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.all(20),
                 child: Text(
                   "Sistema\nde\nevacuacion",
                   style: TextStyle(
                     fontSize: 25,
                     fontFamily: "Poppins",
                     color: Colors.white,
                   ),
                   textAlign: TextAlign.center,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.all(20),
                 child:  ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.purple,
                     onPrimary: Colors.white,
                     shadowColor: Colors.black,
                     elevation: 3,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(32.0)),
                     minimumSize: Size(screenWidth/1.7, 50), //////// HERE
                   ),
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const MapScreen()),
                     );
                   },
                   child: Text(
                     'Comenzar',
                     style: TextStyle(
                       fontSize: screenHeight/40
                     ),
                   ),
                 )
               )
             ],
            ),
          ],
        ),
      ),
    );
  }
}
