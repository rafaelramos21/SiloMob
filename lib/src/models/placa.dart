class Placa {
  final int? id;
  final String placa;
  final String modelo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Placa({
    this.id,
    required this.placa,
    required this.modelo,
    this.createdAt,
    this.updatedAt,
  });

  factory Placa.fromJson(Map<String, dynamic> json) {
    return Placa(
      id: json['id'],
      placa: json['placa'],
      modelo: json['modelo'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placa': placa,
      'modelo': modelo,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }
}
