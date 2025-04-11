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
      createdAt: json['created_at'],
      status: json['status'],
      numeroTicket: json['numero_ticket'],
      sacas: json['sacas'],
      umidadeTeor: (json['umidade_teor'] as num?)?.toDouble(),
      avariadoTeor: (json['avariado_teor'] as num?)?.toDouble(),
      impurezaTeor: (json['impureza_teor'] as num?)?.toDouble(),
      descontoTotal: (json['desconto_total'] as num?)?.toDouble(),
      talhao: json['talhao'],
      user: json['user'],
    );
  }
}
