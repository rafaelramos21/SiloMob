class Motorista {
  final int id;
  final String nome;

  Motorista({required this.id, required this.nome});

  factory Motorista.fromJson(Map<String, dynamic> json) {
    return Motorista(
      id: json['id'],
      nome: json['nome'],
    );
  }
}

class Placa {
  final int id;
  final String placa;
  final String modelo;

  Placa({required this.id, required this.placa, required this.modelo});

  factory Placa.fromJson(Map<String, dynamic> json) {
    return Placa(
      id: json['id'],
      placa: json['placa'],
      modelo: json['modelo'],
    );
  }
}

class Caminhao {
  final int id;
  final String createdAt;
  final String updatedAt;
  final Motorista motorista;
  final Placa placa;

  Caminhao({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.motorista,
    required this.placa,
  });

  factory Caminhao.fromJson(Map<String, dynamic> json) {
    return Caminhao(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      motorista: Motorista.fromJson(json['motorista']),  // Transformando o 'motorista' para o objeto Motorista
      placa: Placa.fromJson(json['placa']),  // Transformando o 'placa' para o objeto Placa
    );
  }
}
