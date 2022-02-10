import 'package:flutter/material.dart';
import 'package:realplaza_evacuacion_app/evacuation_map/UI/screens/evacuation_route_screen.dart';
import 'package:realplaza_evacuacion_app/widgets/background.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Background(espec: "purple", height: screenHeight),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: 20
                    ),
                    Text(
                      "Seleccione el nodo más cercano a usted",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height: 10
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: screenHeight/1.4,
                        width: screenWidth/1.1,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/map.png",
                                ),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "A")),
                            );
                          },
                          tooltip: 'nodo A',
                          child: Text(
                            "A",
                            style: TextStyle(
                              fontSize: 40
                            ),
                          ),
                          heroTag: "A",
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "B")),
                            );
                          },
                          tooltip: 'nodo B',
                          child: Text(
                            "B",
                            style: TextStyle(
                                fontSize: 40
                            ),
                          ),
                          heroTag: "B",
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "C")),
                            );
                          },
                          tooltip: 'nodo C',
                          child: Text(
                            "C",
                            style: TextStyle(
                                fontSize: 40
                            ),
                          ),
                          heroTag: "C",
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "D")),
                            );
                          },
                          tooltip: 'nodo D',
                          child: Text(
                            "D",
                            style: TextStyle(
                                fontSize: 40
                            ),
                          ),
                          heroTag: "D",
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "E")),
                            );
                          },
                          tooltip: 'nodo E',
                          child: Text(
                            "E",
                            style: TextStyle(
                                fontSize: 40
                            ),
                          ),
                          heroTag: "E",
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EvacuationRouteScreen(nodoSeleccionado: "F")),
                            );
                          },
                          tooltip: 'nodo F',
                          child: Text(
                            "F",
                            style: TextStyle(
                                fontSize: 40
                            ),
                          ),
                          heroTag: "F",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
