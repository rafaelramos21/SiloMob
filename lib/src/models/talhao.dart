import 'propriedade.dart';
class Talhao {
  final int? id;
  final String nome;
  final Propriedade? propriedade;
  final DateTime? createdAt;
  final DateTime updatedAt;

  Talhao({
   this.id,
    required this.nome,
    this.propriedade,
    this.createdAt,
    required this.updatedAt,
  });

  factory Talhao.fromJson(Map<String, dynamic> json) {
    return Talhao(
      id: json['id'],
      nome: json['nome'],
      propriedade: Propriedade.fromJson(json['propriedade']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
