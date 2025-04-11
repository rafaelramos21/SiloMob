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
  List<Usuario> usuarios = [];

  void _atualizarListaUsuarios(Usuario usuario) {
    setState(() {
      usuarios.add(usuario);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.list_alt),
              label: const Text('Lista de Usuários'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaUsuariosPage(usuariosList: usuarios),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Cadastrar Usuário'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroUsuarioPage(
                      onUsuarioAdicionado: _atualizarListaUsuarios,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
