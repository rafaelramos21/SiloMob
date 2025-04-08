import 'package:flutter/material.dart';
import '../../../models/motorista.dart';
import '../../../services/api_motorista.dart';

class CadastroMotoristaPage extends StatefulWidget {
  final Function() onMotoristaAdicionado;

  CadastroMotoristaPage({Key? key, required this.onMotoristaAdicionado}) : super(key: key);

  @override
  _CadastroMotoristaPageState createState() => _CadastroMotoristaPageState();
}

class _CadastroMotoristaPageState extends State<CadastroMotoristaPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final ApiMotorista apiMotorista = ApiMotorista();

  void _salvarMotorista() async {
    final nome = _nomeController.text;
    final cpf = _cpfController.text;

    if (nome.isNotEmpty && cpf.isNotEmpty) {
      final novoMotorista = Motorista(nome: nome, cpf: cpf);
      
      bool sucesso = await apiMotorista.createMotorista(novoMotorista);
      
      if (sucesso) {
        widget.onMotoristaAdicionado(); // Atualiza a lista na outra tela
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar motorista')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Motorista')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cpfController,
              decoration: InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarMotorista,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
