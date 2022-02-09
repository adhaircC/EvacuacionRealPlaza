import 'package:dijkstra/dijkstra.dart';

main() {
  Map graph = {
    0: {1:1,2:2},
    1: {0:1,3:4},
    2: {0:2,3:1},
    3: {2:1,1:4},

  };
  int from = 0;
  int to = 3;

  var output2 = Dijkstra.findPathFromGraph(graph, from, to);
  print("output2:");
  print(output2);
  /// output1:
  /// [114, 113, 0, 6, 5]
  /// output2:
  /// [114, 113, 0, 6, 5]
}