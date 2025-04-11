class Romaneio {
  final String createdAt;
  final String status;
  final int numeroTicket;
  final int? sacas;
  final double? umidadeTeor;
  final double? avariadoTeor;
  final double? impurezaTeor;
  final double? descontoTotal;
  final int talhao;
  final int user;

  Romaneio({
    required this.createdAt,
    required this.status,
    required this.numeroTicket,
    this.sacas,
    this.umidadeTeor,
    this.avariadoTeor,
    this.impurezaTeor,
    this.descontoTotal,
    required this.talhao,
    required this.user,
  });

  factory Romaneio.fromJson(Map<String, dynamic> json) {
  return Romaneio(
    createdAt: json['created_at'] ?? '',
    status: json['status'] ?? '',
    numeroTicket: json['numero_ticket'] ?? 0,
    sacas: json['sacas'] != null ? int.tryParse(json['sacas'].toString()) : null,
    umidadeTeor: json['umidade_teor'] != null ? double.tryParse(json['umidade_teor'].toString()) : null,
    avariadoTeor: json['avariado_teor'] != null ? double.tryParse(json['avariado_teor'].toString()) : null,
    impurezaTeor: json['impureza_teor'] != null ? double.tryParse(json['impureza_teor'].toString()) : null,
    descontoTotal: json['desconto_total'] != null ? double.tryParse(json['desconto_total'].toString()) : null,
    talhao: json['talhao'] ?? 0,
    user: json['user'] ?? 0,
  );
}

}
