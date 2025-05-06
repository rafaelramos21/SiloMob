import 'package:flutter/material.dart';
import '../../../models/talhao.dart';
import '../../../models/propriedade.dart';
import '../../../services/api_talhao.dart';
import '../../../services/api_propriedade.dart';

class CadastroTalhaoPage extends StatefulWidget {
  final List<Propriedade> propriedades;
  final Function onTalhaoAdicionado;

  const CadastroTalhaoPage({Key? key, required this.propriedades, required this.onTalhaoAdicionado}) : super(key: key);

  @override
  _CadastroTalhaoPageState createState() => _CadastroTalhaoPageState();
}

class _CadastroTalhaoPageState extends State<CadastroTalhaoPage> {
  final ApiTalhao apiTalhao = ApiTalhao();
  final TextEditingController nomeController = TextEditingController();
  late Propriedade propriedadeSelecionada;

  @override
  void initState() {
    super.initState();
    propriedadeSelecionada = widget.propriedades[0];  // Inicializa com o primeiro produtor
  }

  void _salvarTalhao() async {
    try {
      await apiTalhao.adicionarTalhao(nomeController.text, propriedadeSelecionada.id!);
      widget.onTalhaoAdicionado();  // Atualiza a lista após o cadastro
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao salvar talhão')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Talhão')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Talhão'),
            ),
            DropdownButton<Propriedade>(
              value: propriedadeSelecionada,
              onChanged: (Propriedade? newValue) {
                setState(() {
                  propriedadeSelecionada = newValue!;
                });
              },
              items: widget.propriedades.map<DropdownMenuItem<Propriedade>>((Propriedade propriedade) {
                return DropdownMenuItem<Propriedade>(
                  value: propriedade,
                  child: Text(propriedade.nome),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _salvarTalhao,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
