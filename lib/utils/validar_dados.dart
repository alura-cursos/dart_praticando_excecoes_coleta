import '../exceptions/exceptions.dart';

void validarDados(Map<String, dynamic> map) {
  // ID precisa ser int
  if (map['id'] is! int) {
    throw InvalidIdException(map['id']);
  }

  // Nome obrigatório
  if (map['nome'] == null || map['nome'].toString().trim().isEmpty) {
    throw EmptyFieldException('nome');
  }

  // Endereço obrigatório
  if (map['endereco'] == null || map['endereco'].toString().trim().isEmpty) {
    throw EmptyFieldException('endereco');
  }

  // Lista de materiais obrigatória e não vazia
  if (map['materiais_aceitos'] == null || map['materiais_aceitos'].isEmpty) {
    throw EmptyMaterialsException();
  }

  // Nível de preenchimento não pode ser negativo
  if (map['nivel_preenchimento'] == null || map['nivel_preenchimento'] < 0) {
    throw NegativeFillLevelException(map['nivel_preenchimento']);
  }
}
