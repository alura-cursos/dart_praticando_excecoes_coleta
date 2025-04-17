import 'package:dart_praticando_coleta/data/dados_corrompidos.dart';
import 'package:dart_praticando_coleta/data/dados_integros.dart';
import 'package:dart_praticando_coleta/exceptions/exceptions.dart';
import 'package:dart_praticando_coleta/models/collection_point.dart';
import 'package:dart_praticando_coleta/services/coleta_services.dart';
import 'package:dart_praticando_coleta/utils/processar_dados.dart';
import 'package:dart_praticando_coleta/utils/validar_dados.dart';

void main() async {
  final listaDadosIntegros = dadosIntegros;
  final listaDadosCorrompidos = dadosCorrompidos;

  List<Map<String, dynamic>> listAPI = [];

  try {
    listAPI =
        await ColetaService(
          "https://github.com/alura-cursos/dart_praticando_excecoes_coleta/raw/refs/heads/main/assets/postos_coleta.json",
        ).fetchPontosDeColeta();
  } catch (e) {
    print(e);
  }

  if (listAPI.isNotEmpty) {
    List<CollectionPoint> listaParaProcessar = [];

    for (Map<String, dynamic> mapa in listAPI) {
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
}
