import 'package:flutter/material.dart';
import '../../../models/motorista.dart';

class ListaMotoristaPage extends StatelessWidget {
  final List<Motorista> motoristasList;

  ListaMotoristaPage({Key? key, required this.motoristasList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Motoristas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: motoristasList.length,
        itemBuilder: (context, index) {
          final motorista = motoristasList[index];
          return ListTile(
            title: Center(
              child: Text(motorista.nome),
            ),
            subtitle: Center(
              child: Text('CPF: ${motorista.cpf}'),
            ),
          );
        },
      ),
    );
  }
}
