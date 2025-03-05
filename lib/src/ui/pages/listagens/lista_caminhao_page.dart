import 'package:flutter/material.dart';
import 'package:projetosilo/src/models/caminhao.dart';

class ListaCaminhaoPage extends StatelessWidget {
  final List<Caminhao> caminhaoList;

  ListaCaminhaoPage({Key? key, required this.caminhaoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Motoristas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: caminhaoList.length,
        itemBuilder: (context, index) {
          final caminhao = caminhaoList[index];
          return ListTile(
            title: Center(
              child: Text('Modelo: ${caminhao.modelo}'),
            ),
            subtitle: Center(
              child: Text('Placa: ${caminhao.placa}'),
            ),
          );
        },
      ),
    );
  }
}
