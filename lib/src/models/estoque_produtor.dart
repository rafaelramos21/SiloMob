import 'produto.dart';
class EstoquePorProdutor {
  final String produtor;
  final int totalSacas;
  final List<Produto> produtos;

  EstoquePorProdutor({
    required this.produtor,
    required this.totalSacas,
    required this.produtos,
  });

  factory EstoquePorProdutor.fromJson(Map<String, dynamic> json) {
    return EstoquePorProdutor(
      produtor: json['produtor'],
      totalSacas: json['total_sacas'],
      produtos: List<Produto>.from(
        json['produtos'].map((p) => Produto.fromJson(p)),
      ),
    );
  }
}
