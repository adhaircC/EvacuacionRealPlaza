import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/material.dart';
import 'package:realplaza_evacuacion_app/widgets/background.dart';

class EvacuationRouteScreen extends StatefulWidget {
  const EvacuationRouteScreen({Key? key, required this.nodoSeleccionado}) : super(key: key);

  final String nodoSeleccionado;
  @override
  _EvacuationRouteScreenState createState() => _EvacuationRouteScreenState();
}

class _EvacuationRouteScreenState extends State<EvacuationRouteScreen> {
  final Map graph = {
    1: {2:100,3:200,4:300,5:250,6:350,10:10,20:20,30:30,40:40,50:60,60:70,70:80},
    2: {1:100,3:100,4:200,5:150,6:250,10:10,20:10,30:20,40:30,50:40,60:60,70:70},
    3: {2:100,1:200,4:100,5:50,6:150,10:20,10:15,30:10,40:15,50:30,60:40,70:50},
    4: {2:200,3:100,1:300,5:200,6:200,10:70,20:60,30:50,40:30,50:10,60:10,70:10},
    5: {2:150,3:50,4:200,1:250,6:200,10:70,20:60,30:50,40:20,50:20,60:30,70:40},
    6: {1:350,3:150,4:200,5:200,2:250,10:70,20:60,30:40,40:50,50:20,60:10,70:10},
  };

  var diccionario = {
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
    'E': 5,
    'F': 6,

    'Salida1': 10,
    'Salida2': 20,
    'Salida3': 30,
    'Salida4': 40,
    'Salida5': 50,
    'Salida6': 60,
    'Salida7': 70,
  };

  var diccionarioReversa = {
    1 :'A',
    2 :'B',
    3 :'C',
    4 :'D',
    5 :'E',
    6 :'F',

    10: 'Salida1',
    20: 'Salida2',
    30: 'Salida3',
    40: 'Salida4',
    50: 'Salida5',
    60: 'Salida6',
    70: 'Salida7',
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int inicio = 0;
    int salida = 0;

    var caminoOptimo = [];
    int mejorCamino = 100;
    for( var i = 1 ; i < 7  ; i++ ) {
      inicio = int.parse(diccionario[widget.nodoSeleccionado].toString());
      salida = int.parse(diccionario["Salida"+i.toString()].toString());
      var caminoCorto = Dijkstra.findPathFromGraph(graph, inicio ,salida);
      if(caminoCorto.length < mejorCamino){
        caminoOptimo = caminoCorto;
        mejorCamino = caminoCorto.length;
      }
      print(inicio);
      print(salida);
      print(caminoOptimo);
    }
    print(caminoOptimo);
    print(diccionarioReversa[1]);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Background(espec: "purple", height: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 20
                  ),
                  Text(
                    "Siga la ruta indicada ->",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          for( int i  in caminoOptimo) Flexible(
                            child: FloatingActionButton(
                              onPressed: (){

                              },
                              tooltip: 'nodo',
                              child: Text(
                                diccionarioReversa[i].toString(),
                                style: TextStyle(

                                ),
                              ),
                              heroTag: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: screenHeight/1.4,
                      width: screenWidth/1.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/nuevoMapa.png",
                              ),
                              fit: BoxFit.fill
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
