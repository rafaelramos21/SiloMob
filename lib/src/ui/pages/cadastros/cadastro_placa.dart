import 'package:flutter/material.dart';
import '../../../models/placa.dart';
import '../../../services/api_placa.dart';

class CadastroPlacaPage extends StatefulWidget {
  final Function() onPlacaAdicionada;

  const CadastroPlacaPage({Key? key, required this.onPlacaAdicionada}) : super(key: key);

  @override
  State<CadastroPlacaPage> createState() => _CadastroPlacaPageState();
}

class _CadastroPlacaPageState extends State<CadastroPlacaPage> {
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final ApiPlaca apiPlaca = ApiPlaca();

  void _salvarPlaca() async {
    final placa = _placaController.text;
    final modelo = _modeloController.text;

    if (placa.isNotEmpty && modelo.isNotEmpty) {
      final novaPlaca = Placa(placa: placa, modelo: modelo);
      final sucesso = await apiPlaca.createPlaca(novaPlaca);

      if (sucesso) {
        widget.onPlacaAdicionada();
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar placa')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Preencha todos os campos!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Placa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _placaController,
              decoration: InputDecoration(labelText: 'Placa'),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarPlaca,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
