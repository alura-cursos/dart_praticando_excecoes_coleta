import 'package:dart_praticando_coleta/data/dados_corrompidos.dart';
import 'package:dart_praticando_coleta/data/dados_integros.dart';
import 'package:dart_praticando_coleta/exceptions/exceptions.dart';
import 'package:dart_praticando_coleta/models/collection_point.dart';
import 'package:dart_praticando_coleta/utils/processar_dados.dart';
import 'package:dart_praticando_coleta/utils/validar_dados.dart';

void main() {
  final listaDadosIntegros = dadosIntegros;
  final listaDadosCorrompidos = dadosCorrompidos;

  List<CollectionPoint> listaParaProcessar = [];

  for (Map<String, dynamic> mapa in listaDadosCorrompidos) {
    try {
      validarDados(mapa); // essa função chama a função de validação
      CollectionPoint collectionPoint = CollectionPoint.fromMap(mapa);
      listaParaProcessar.add(collectionPoint);
    } on InvalidIdException catch (e) {
      print('❌ Erro de ID: ${e.toString()}');
    } on EmptyFieldException catch (e) {
      print('❌ Campo obrigatório ausente: ${e.toString()}');
    } on EmptyMaterialsException catch (e) {
      print('❌ Materiais inválidos: ${e.toString()}');
    } on NegativeFillLevelException catch (e) {
      print('❌ Nível de preenchimento inválido: ${e.toString()}');
    } catch (e) {
      print('❌ Erro inesperado ao processar o mapa: $e');
    }
  }

  print("\n");
  processarDados(listaParaProcessar);
}
