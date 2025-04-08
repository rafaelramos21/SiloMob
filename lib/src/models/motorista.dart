class Motorista {
  final int? id;
  final String nome;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Motorista({
    this.id,
    required this.nome,
    this.createdAt,
    this.updatedAt,
  });

  factory Motorista.fromJson(Map<String, dynamic> json) {
    return Motorista(
      id: json['id'],
      nome: json['nome'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      // só manda os campos se forem não-nulos (útil para POST)
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }
}
