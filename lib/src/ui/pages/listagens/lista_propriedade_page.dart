import 'package:flutter/material.dart';
import '../../../models/propriedade.dart';

class ListaPropriedadesPage extends StatelessWidget {
  final List<Propriedade> propriedades;

  ListaPropriedadesPage({Key? key, required this.propriedades}) : super(key: key);

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

          return ListTile(
            title: Text(propriedade.nome),
            subtitle: Text('Produtor: ${propriedade.produtor.nome}'),
          );
        },
      ),
    );
  }
}
