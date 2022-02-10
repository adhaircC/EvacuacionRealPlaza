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
  ///Grafo de las ruta del real plaza
  Map graph = {
    1: {2:100,3:200,4:300,5:250,6:350,10:10,20:20,30:30,40:40,50:60},
    2: {1:100,3:100,4:200,5:150,6:250,10:10,20:10,30:20,40:30,50:40},
    3: {2:100,1:200,4:100,5:50,6:150,10:20,20:15,30:10,40:15,50:30},
    4: {2:200,3:100,1:300,5:200,6:50,10:70,20:100,30:100,40:100,50:100},
    5: {2:150,3:50,4:200,1:250,6:200,10:70,20:60,30:50,40:20,50:20},
    6: {1:350,3:150,4:200,5:200,2:250,10:70,20:60,30:40,40:50,50:20,60:15,70:10},
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

    var caminos = [];
    var caminoOptimo = [];
    num mejorCamino = 10000;
    for( var i = 1 ; i < 8  ; i++ ) {
      inicio = int.parse(diccionario[widget.nodoSeleccionado].toString());
      salida = int.parse(diccionario["Salida"+i.toString()].toString());
      var caminoCorto = Dijkstra.findPathFromGraph(graph, inicio ,salida);
      caminos.add(caminoCorto);
    }

    for (List camino in caminos){
      num tmp = 0;
      for(int i=1; i<camino.length; i++){
        tmp += graph[camino[i-1]][camino[i]];
      }
      if(mejorCamino > tmp){
        mejorCamino = tmp;
        caminoOptimo = camino;
      }
    }

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
                    const SizedBox(
                        height: 20
                    ),
                    const Text(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            for( int i  in caminoOptimo) Padding(
                              padding: const EdgeInsets.all(3),
                              child: FloatingActionButton(
                                onPressed: (){

                                },
                                tooltip: 'nodo',
                                child: Text(
                                  diccionarioReversa[i].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold
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
                            image: const DecorationImage(
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
      ),
    );
  }
}
