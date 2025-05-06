import 'package:flutter/material.dart';
import '../../../models/propriedade.dart';

class ListaPropriedadesPage extends StatelessWidget {
  final List<Propriedade> propriedades;

  const ListaPropriedadesPage({Key? key, required this.propriedades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Propriedades'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: propriedades.length,
        itemBuilder: (context, index) {
          final propriedade = propriedades[index];
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
                  propriedade.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Produtor: ${propriedade.produtor.nome}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
