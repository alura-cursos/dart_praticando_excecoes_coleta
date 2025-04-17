import 'dart:convert';
import 'package:http/http.dart' as http;

class ColetaService {
  final String url;

  ColetaService(this.url);

  Future<List<Map<String, dynamic>>> fetchPontosDeColeta() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      if (jsonMap.containsKey('pontos_coleta') &&
          jsonMap['pontos_coleta'] is List) {
        return List<Map<String, dynamic>>.from(jsonMap['pontos_coleta']);
      } else {
        throw FormatException(
          'Estrutura JSON inválida: chave "pontos_coleta" ausente ou mal formada.',
        );
      }
    } else {
      throw Exception('Erro ao buscar dados: status ${response.statusCode}');
    }
  }
}
