class Romaneio {
  final String createdAt;
  final String status;
  final int numeroTicket;
  final double? sacas;
  final double? umidadeTeor;
  final double? avariadoTeor;
  final double? impurezaTeor;
  final double? descontoTotal;
  final Talhao? talhao;
  final User? user;
  final bool entrada;


  Romaneio({
    required this.createdAt,
    required this.status,
    required this.numeroTicket,
    this.sacas,
    this.umidadeTeor,
    this.avariadoTeor,
    this.impurezaTeor,
    this.descontoTotal,
    this.talhao,
    this.user,
    required this.entrada,

  });

  factory Romaneio.fromJson(Map<String, dynamic> json) {
  return Romaneio(
    createdAt: json['created_at'] ?? '',
    status: json['status'] ?? '',
    numeroTicket: json['numero_ticket'] ?? 0,
    sacas: json['sacas'] != null ? double.tryParse(json['sacas'].toString()) : null,
    umidadeTeor: json['umidade_teor'] != null ? double.tryParse(json['umidade_teor'].toString()) : null,
    avariadoTeor: json['avariado_teor'] != null ? double.tryParse(json['avariado_teor'].toString()) : null,
    impurezaTeor: json['impureza_teor'] != null ? double.tryParse(json['impureza_teor'].toString()) : null,
    descontoTotal: json['desconto_total'] != null ? double.tryParse(json['desconto_total'].toString()) : null,
    talhao: json['talhao'] != null ? Talhao.fromJson(json['talhao']) : null,
    user: json['user'] != null ? User.fromJson(json['user']) : null,
    entrada: json['entrada'] ?? true,
  );
}

}

class Talhao {
  final int id;
  final String nome;

  Talhao({
    required this.id,
    required this.nome,
  });

  factory Talhao.fromJson(Map<String, dynamic> json) {
    return Talhao(
      id: json['id'],
      nome: json['nome'],
    );
  }
}

class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
    );
  }
}

