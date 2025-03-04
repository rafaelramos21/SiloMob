import 'package:flutter/material.dart';
import '../../../models/usuarios.dart';

class ListaUsuariosPage extends StatelessWidget {
  final List<Usuario> usuarios;

  ListaUsuariosPage({Key? Key, required this.usuarios}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index){
          final usuario = usuarios[index];
          return ListTile(
            title: Center(
              child: Text(usuario.nome),
            ),
            subtitle: Center(
              child: Text('Cpf: ${usuario.cpf}'),
            ),
          );
        }
        ),
    );
  }
}