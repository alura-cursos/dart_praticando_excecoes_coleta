import 'package:dart_praticando_coleta/data/dados_corrompidos.dart';
import 'package:dart_praticando_coleta/data/dados_integros.dart';
import 'package:dart_praticando_coleta/models/collection_point.dart';
import 'package:dart_praticando_coleta/utils/processar_dados.dart';

void main() {
  final listaDadosIntegros = dadosIntegros;
  final listaDadosCorrompidos = dadosCorrompidos;

  List<CollectionPoint> listaParaProcessar = [];

  for (Map<String, dynamic> mapa in listaDadosCorrompidos) {
    CollectionPoint collectionPoint = CollectionPoint.fromMap(mapa);
    listaParaProcessar.add(collectionPoint);
  }

  processarPontosDeColeta(listaParaProcessar);
}
