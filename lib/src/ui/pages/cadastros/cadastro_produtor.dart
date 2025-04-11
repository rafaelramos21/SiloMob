import 'package:flutter/material.dart';
import '../../../services/api_produtor.dart';

class CadastroProdutorPage extends StatefulWidget {
  final VoidCallback onProdutorAdicionado;

  const CadastroProdutorPage({Key? key, required this.onProdutorAdicionado}) : super(key: key);

  @override
  State<CadastroProdutorPage> createState() => _CadastroProdutorPageState();
}

class _CadastroProdutorPageState extends State<CadastroProdutorPage> {
  final TextEditingController _nomeController = TextEditingController();
  final ApiProdutor apiProdutor = ApiProdutor();

  void _salvar() async {
    final nome = _nomeController.text;

    if (nome.isNotEmpty) {
      try {
        await apiProdutor.adicionarProdutor(nome);
        widget.onProdutorAdicionado();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar produtor')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Produtor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Produtor'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvar,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
