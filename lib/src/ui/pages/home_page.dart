import 'package:flutter/material.dart';
import 'lista_usuarios_page.dart';
import '../models/usuarios.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? Key}) : super(key: Key);

  //Usuarios Teste
  final List<Usuario> usuarios = [
    Usuario(nome: 'Rafael Ribeiro Ramos', cpf: '47567271826'),
    Usuario(nome: 'João Pedro Ruy', cpf: '12345678900'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaUsuariosPage(usuarios: usuarios),
              ),
            );
          },
          child: Text('Usuarios'),
        ),
      ),
    );
  }
}
