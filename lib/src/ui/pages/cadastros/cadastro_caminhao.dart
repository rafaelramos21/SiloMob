import 'package:flutter/material.dart';
import '../../../models/caminhao.dart';

class CadastroCaminhaoPage extends StatefulWidget {
  final Function(Caminhao) onCaminhaoAdicionado;

  const CadastroCaminhaoPage({Key? key, required this.onCaminhaoAdicionado}) : super(key: key);

  @override
  _CadastroCaminhaoPageState createState() => _CadastroCaminhaoPageState();
}

class _CadastroCaminhaoPageState extends State<CadastroCaminhaoPage> {
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();

  void _salvarCaminhao() {
    final modelo = _modeloController.text.trim();
    final placa = _placaController.text.trim();

    if (modelo.isNotEmpty && placa.isNotEmpty) {
      // Criando um novo objeto Caminhao
      final novoCaminhao = Caminhao(
        id: 0,  // O ID é 0 pois ele ainda não existe, o backend gerará
        createdAt: '',  // Deixe o campo vazio ou use um valor padrão
        updatedAt: '',  // Deixe o campo vazio ou use um valor padrão
        motorista: Motorista(id: 0, nome: ''),  // Se necessário, ajuste conforme o back-end
        placa: Placa(id: 0, placa: placa, modelo: modelo),
      );

      widget.onCaminhaoAdicionado(novoCaminhao);
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
      appBar: AppBar(title: const Text('Cadastro de Caminhão')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _placaController,
              decoration: const InputDecoration(labelText: 'Placa'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarCaminhao,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
