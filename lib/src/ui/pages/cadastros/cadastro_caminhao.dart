import 'package:flutter/material.dart';
import '../../../models/caminhao.dart';

class CadastroCaminhaoPage extends StatefulWidget {
  final Function(Caminhao) onCaminhaoAdicionado;

  CadastroCaminhaoPage({Key? key, required this.onCaminhaoAdicionado}) : super(key:key);

  @override
  _CadastroCaminhaoPageState createState() => _CadastroCaminhaoPageState();
}

class _CadastroCaminhaoPageState extends State<CadastroCaminhaoPage> {
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();

  void _salvarCaminhao(){
    final modelo = _modeloController.text;
    final placa = _placaController.text;

    if (modelo.isNotEmpty && placa.isNotEmpty){
      final novoCaminhao = Caminhao(modelo: modelo, placa: placa);
      widget.onCaminhaoAdicionado(novoCaminhao);
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
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _salvarCaminhao,
              child: const Text('Salvar'),
            ),
          ],
        )
      ),
    );
  }
}