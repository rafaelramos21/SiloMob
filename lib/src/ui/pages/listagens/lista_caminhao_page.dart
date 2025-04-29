import 'package:flutter/material.dart';
import '../../../services/api_caminhao.dart';  // Importe a classe ApiCaminhao
import '../../../models/caminhao.dart'; // Classe ApiCaminhao

class ListaCaminhaoPage extends StatelessWidget {
  final Future<List<Caminhao>> caminhaoFuture;

  const ListaCaminhaoPage({Key? key, required this.caminhaoFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Caminhões'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Caminhao>>(
        future: caminhaoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum caminhão encontrado.'));
          } else {
            final caminhoes = snapshot.data!;
            return ListView.builder(
              itemCount: caminhoes.length,
              itemBuilder: (context, index) {
                final caminhao = caminhoes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Modelo: ${caminhao.placa.modelo}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Placa: ${caminhao.placa.placa}'),
                        Text('Motorista: ${caminhao.motorista.nome}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
