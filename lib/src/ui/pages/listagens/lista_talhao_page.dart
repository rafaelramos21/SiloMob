import 'package:flutter/material.dart';
import 'package:projetosilo/src/models/propriedade.dart';
import '../../../models/talhao.dart';

class ListaTalhaoPage extends StatelessWidget {
  final List<Talhao> talhoes;
  final List<Propriedade> propriedades;

  const ListaTalhaoPage({
    Key? key,
    required this.talhoes,
    required this.propriedades,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Talhões'),
        centerTitle: true,
      ),
      body: ListView.builder(
              itemCount: talhoes.length,
              itemBuilder: (context, index) {
                final talhao = talhoes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      title: Text(
                        talhao.nome,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Propriedade: ${talhao.propriedade?.nome ?? 'N/A'}'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
