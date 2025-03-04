import 'package:flutter/material.dart';
import '../../../models/motorista.dart';

class CadastroMotoristaPage extends StatefulWidget {
  final Function(Motorista) onMotoristaAdicionado;

  CadastroMotoristaPage({Key? key, required this.onMotoristaAdicionado}) : super(key:key);

  @override
  _CadastroMotoristaPageState createState() => _CadastroMotoristaPageState();
}

class _CadastroMotoristaPageState extends State<CadastroMotoristaPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  void _salvarMotorista(){
    final nome = _nomeController.text;
    final cpf = _cpfController.text;

    if (nome.isNotEmpty && cpf.isNotEmpty){
      final novoMotorista = Motorista(nome: nome, cpf: cpf);
      widget.onMotoristaAdicionado(novoMotorista);
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
      appBar: AppBar(title: const Text('Cadastro de Motorista')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _salvarMotorista,
              child: const Text('Salvar'),
            ),
          ],
        )
      ),
    );
  }
}