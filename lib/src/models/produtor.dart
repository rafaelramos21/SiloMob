class Produtor {
  final int id;
  final String nome;
  final DateTime createdAt;
  final DateTime updatedAt;

  Produtor({
    required this.id,
    required this.nome,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Produtor.fromJson(Map<String, dynamic> json) {
    return Produtor(
      id: json['id'],
      nome: json['nome'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
    };
  }
}
