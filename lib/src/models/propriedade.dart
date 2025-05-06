import 'produtor.dart'; // ou ajuste o caminho conforme sua estrutura

class Propriedade {
  final int? id;
  final String nome;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic produtor;

  Propriedade({
    this.id,
    required this.nome,
    this.createdAt,
    this.updatedAt,
    required this.produtor,
  });

  factory Propriedade.fromJson(Map<String, dynamic> json) {
    return Propriedade(
      id: json['id'],
      nome: json['nome'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      produtor: json['produtor'] is Map<String, dynamic> ? Produtor.fromJson(json['produtor']) : json['produtor']);
  }
}
