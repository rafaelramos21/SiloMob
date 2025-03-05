import 'package:flutter/material.dart';
import 'package:projetosilo/src/models/usuarios.dart';


class CadastroUsuarioPage extends StatefulWidget {
  final Function(Usuario) onUsuarioAdicionado;

  CadastroUsuarioPage({Key? key, required this.onUsuarioAdicionado}) : super(key:key);

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _salvarUsuario(){
    final nome = _nomeController.text;
    final senha = _senhaController.text;

    if (nome.isNotEmpty && senha.isNotEmpty){
      final novoUsuario = Usuario(nome: nome, senha: senha);
      widget.onUsuarioAdicionado(novoUsuario);
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _salvarUsuario,
              child: const Text('Salvar'),
            ),
          ],
        )
      ),
    );
  }
}