import 'package:flutter/material.dart';
import '../../services/api_estoque.dart';
import '../../models/estoque_response.dart';

class EstoquePage extends StatelessWidget {
  const EstoquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
      ),
      body: FutureBuilder<EstoqueResponse>(
        future: ApiEstoque().fetchEstoque(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Nenhum dado disponível'));
          }

          final estoque = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  // Card Estoque Geral com "fake" padding para forçar altura parecida
                  _buildCard(
                    title: 'Estoque Geral',
                    total: estoque.estoqueGeral.totalSacas,
                    produtos: estoque.estoqueGeral.produtos,
                    extraSpacing: 2, // <-- este parâmetro ajuda a equilibrar
                  ),
                  const SizedBox(height: 24),
                  ...estoque.estoquePorProdutor.map(
                    (produtor) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _buildCard(
                        title: produtor.produtor,
                        total: produtor.totalSacas,
                        produtos: produtor.produtos,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({
  required String title,
  required int total,
  required List produtos,
  int extraSpacing = 0,
}) {
  return Container(
    width: 600, // <-- largura fixa agora
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Card(
      color: const Color(0xFF81C784),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              'Total de sacas: $total',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...produtos.map<Widget>((p) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    '${p.produto}: ${p.totalSacas} sacas',
                    style: const TextStyle(fontSize: 15),
                  ),
                )),
            for (int i = 0; i < extraSpacing; i++) const SizedBox(height: 16),
          ],
        ),
      ),
    ),
  );
}
}
