import '../models/collection_point.dart';

void processarPontosDeColeta(List<CollectionPoint> pontos) {
  // 1. Listar todos os pontos ordenados por ID
  print('=== Todos os pontos de coleta ===');

  List<CollectionPoint> ordenados = List.from(pontos);
  ordenados.sort((a, b) => a.id.compareTo(b.id));

  for (int i = 0; i < ordenados.length; i++) {
    CollectionPoint p = ordenados[i];
    print(
      '[${p.id}] ${p.name} - ${p.address} '
      '(Preenchimento: ${(p.fillLevel * 100).toStringAsFixed(0)}%)',
    );
  }

  // 2. Pontos com nível de preenchimento acima de 60%
  print('\n=== Pontos que precisam de coleta (acima de 60%) ===');

  List<CollectionPoint> criticos = [];
  for (int i = 0; i < pontos.length; i++) {
    if (pontos[i].fillLevel > 0.6) {
      criticos.add(pontos[i]);
    }
  }

  criticos.sort((a, b) => b.fillLevel.compareTo(a.fillLevel));

  for (int i = 0; i < criticos.length; i++) {
    CollectionPoint p = criticos[i];
    print(
      '[${p.id}] ${p.name} - ${(p.fillLevel * 100).toStringAsFixed(0)}% cheio',
    );
  }

  // 3. Agrupamento por material aceito
  print('\n=== Agrupamento por material aceito ===');
  Map<String, List<CollectionPoint>> agrupado = {};

  for (int i = 0; i < pontos.length; i++) {
    CollectionPoint p = pontos[i];
    for (int j = 0; j < p.acceptedMaterials.length; j++) {
      String material = p.acceptedMaterials[j];

      if (!agrupado.containsKey(material)) {
        agrupado[material] = [];
      }

      agrupado[material]!.add(p);
    }
  }

  for (String material in agrupado.keys) {
    print('\n>> $material');
    List<CollectionPoint> lista = agrupado[material]!;
    for (int i = 0; i < lista.length; i++) {
      print('  - [${lista[i].id}] ${lista[i].name}');
    }
  }
}
