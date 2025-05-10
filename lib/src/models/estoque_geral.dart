import 'produto.dart';
class EstoqueGeral {
  final int totalSacas;
  final List<Produto> produtos;

  EstoqueGeral({
    required this.totalSacas,
    required this.produtos,
  });

  factory EstoqueGeral.fromJson(Map<String, dynamic> json) {
    return EstoqueGeral(
      totalSacas: json['total_sacas'],
      produtos: List<Produto>.from(
        json['produtos'].map((p) => Produto.fromJson(p)),
      ),
    );
  }
}
