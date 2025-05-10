class Produto {
  final String produto;
  final int totalSacas;

  Produto({required this.produto, required this.totalSacas});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      produto: json['produto'],
      totalSacas: json['total_sacas'],
    );
  }
}
