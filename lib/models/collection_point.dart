class CollectionPoint {
  int id;
  String name;
  double latitude;
  double longitude;
  String address;
  List<String> acceptedMaterials;
  String openingHours;
  double fillLevel;

  CollectionPoint({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.acceptedMaterials,
    required this.openingHours,
    required this.fillLevel,
  });

  factory CollectionPoint.fromMap(Map<String, dynamic> json) {
    return CollectionPoint(
      id: json['id'],
      name: json['nome'],
      latitude: json['localizacao']['latitude'],
      longitude: json['localizacao']['longitude'],
      address: json['endereco'],
      acceptedMaterials: List<String>.from(json['materiais_aceitos']),
      openingHours: json['horario_funcionamento'],
      fillLevel: json['nivel_preenchimento'].toDouble(),
    );
  }
}
