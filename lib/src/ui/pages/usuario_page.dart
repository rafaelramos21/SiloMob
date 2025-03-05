import 'package:flutter/material.dart';
import 'package:projetosilo/src/models/usuarios.dart';
import 'package:projetosilo/src/ui/pages/cadastros/cadastro_usuario.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_usuarios_page.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  List<Usuario> usuarios= [];

  void _atualizarListaUsuarios(Usuario usuario) {
    setState(() {
      usuarios.add(usuario);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaUsuariosPage(usuariosList: usuarios)
                  ),
                );
              },
              child: Text('Lista de Usuarios'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                // Passa a função de atualização da lista para a página de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroUsuarioPage(onUsuarioAdicionado: _atualizarListaUsuarios),
                  ),
                );
              },
              child: const Text('Cadastrar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
