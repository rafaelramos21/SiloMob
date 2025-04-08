class Motorista {
  String nome;
  String cpf;

  Motorista({required this.nome, required this.cpf});

  // 🔹 Converter JSON para Motorista
  factory Motorista.fromJson(Map<String, dynamic> json) {
    return Motorista(
      nome: json['nome'],
      cpf: json['cpf'],
    );
  }

  // 🔹 Converter Motorista para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
    };
  }
}
