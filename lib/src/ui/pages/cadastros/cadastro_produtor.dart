import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/produtor_provider.dart';
import '../../../models/produtor.dart';

class CadastroProdutorPage extends StatefulWidget {
  CadastroProdutorPage({Key? key}) : super(key: key);

  @override
  _CadastroProdutorPageState createState() => _CadastroProdutorPageState();
}

class _CadastroProdutorPageState extends State<CadastroProdutorPage> {
  final TextEditingController _nomeController = TextEditingController();

  void _salvarProdutor() {
    final nome = _nomeController.text;

    if (nome.isNotEmpty) {
      final novoProdutor = Produtor(nome: nome, propriedade: []);

      // Adicionando diretamente no Provider
      Provider.of<ProdutorProvider>(context, listen: false).adicionarProdutor(novoProdutor);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produtor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarProdutor,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
