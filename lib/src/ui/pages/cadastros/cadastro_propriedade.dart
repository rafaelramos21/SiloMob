import 'package:flutter/material.dart';
import '../../../models/produtor.dart';
import '../../../services/api_propriedade.dart';


class CadastroPropriedadePage extends StatefulWidget {
  final VoidCallback onPropriedadeAdicionada;
  final List<Produtor> produtores;

  const CadastroPropriedadePage({
    Key? key,
    required this.onPropriedadeAdicionada,
    required this.produtores,
  }) : super(key: key);

  @override
  State<CadastroPropriedadePage> createState() => _CadastroPropriedadePageState();
}

class _CadastroPropriedadePageState extends State<CadastroPropriedadePage> {
  final TextEditingController _nomeController = TextEditingController();
  final ApiPropriedade apiPropriedade = ApiPropriedade();
  int? _produtorSelecionadoId;

  void _salvar() async {
    final nome = _nomeController.text;
    final produtorId = _produtorSelecionadoId;

    if (nome.isNotEmpty && produtorId != null) {
      try {
        await apiPropriedade.adicionarPropriedade(nome, produtorId);
        widget.onPropriedadeAdicionada();
        Navigator.pop(context);
      } catch (e) {
        print:("Teste");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar propriedade')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Propriedade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome da Propriedade'),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(labelText: 'Produtor'),
              items: widget.produtores
                  .map((produtor) => DropdownMenuItem<int>(
                        value: produtor.id,
                        child: Text(produtor.nome),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _produtorSelecionadoId = value;
                });
              },
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
