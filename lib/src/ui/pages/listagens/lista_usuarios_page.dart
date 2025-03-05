import 'package:flutter/material.dart';
import '../../../models/usuarios.dart';

class ListaUsuariosPage extends StatelessWidget {
  final List<Usuario> usuariosList;

  ListaUsuariosPage({Key? Key, required this.usuariosList}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: usuariosList.length,
        itemBuilder: (context, index){
          final usuario = usuariosList[index];
          return ListTile(
            title: Center(
              child: Text(usuario.nome),
            ),
          );
        }
        ),
    );
  }
}