import 'estoque_produtor.dart';
import 'estoque_geral.dart';

class EstoqueResponse {
  final List<EstoquePorProdutor> estoquePorProdutor;
  final EstoqueGeral estoqueGeral;

  EstoqueResponse({
    required this.estoquePorProdutor,
    required this.estoqueGeral,
  });

  factory EstoqueResponse.fromJson(Map<String, dynamic> json) {
    return EstoqueResponse(
      estoquePorProdutor: List<EstoquePorProdutor>.from(
        json['estoque_por_produtor'].map((e) => EstoquePorProdutor.fromJson(e)),
      ),
      estoqueGeral: EstoqueGeral.fromJson(json['estoque_geral']),
    );
  }
}
