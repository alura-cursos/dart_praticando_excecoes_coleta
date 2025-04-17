class InvalidIdException implements Exception {
  final dynamic id;
  InvalidIdException(this.id);

  @override
  String toString() =>
      'InvalidIdException: ID inválido. Esperado número inteiro, recebeu "$id".';
}

class EmptyFieldException implements Exception {
  final String fieldName;
  EmptyFieldException(this.fieldName);

  @override
  String toString() =>
      'EmptyFieldException: O campo "$fieldName" está vazio e é obrigatório.';
}

class EmptyMaterialsException implements Exception {
  @override
  String toString() =>
      'EmptyMaterialsException: A lista de materiais aceitos está vazia.';
}

class NegativeFillLevelException implements Exception {
  final double value;
  NegativeFillLevelException(this.value);

  @override
  String toString() =>
      'NegativeFillLevelException: O nível de preenchimento não pode ser negativo. Valor recebido: $value.';
}
