class Produtor {
  final int id;
  final String nome;

  Produtor({required this.id, required this.nome});

  factory Produtor.fromJson(Map<String, dynamic> json) {
    return Produtor(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
