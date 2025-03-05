import 'package:flutter/material.dart';
import '../../../models/produtor.dart';
import '../../../models/propriedade.dart';

class CadastroPropriedadePage extends StatefulWidget {
  final List<Produtor> produtores;
  final Function(Propriedade) onPropriedadeAdicionada;

  CadastroPropriedadePage({
    Key? key,
    required this.onPropriedadeAdicionada,
    required this.produtores
  }) : super(key: key);

  @override
  _CadastroPropriedadePageState createState() => _CadastroPropriedadePageState();
}

class _CadastroPropriedadePageState extends State<CadastroPropriedadePage> {
  final TextEditingController _nomePropriedadeController = TextEditingController();
  Produtor? _produtorSelecionado;  // Produtor selecionado para associar à propriedade

  void _salvarPropriedade() {
    final nomePropriedade = _nomePropriedadeController.text;

    if (nomePropriedade.isNotEmpty && _produtorSelecionado != null) {
      final novaPropriedade = Propriedade(nome: nomePropriedade, produtor: _produtorSelecionado!);
      widget.onPropriedadeAdicionada(novaPropriedade);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

 /* @override
void initState() {
  super.initState();
  // Se a lista de produtores não estiver vazia, inicialize com o primeiro produtor
  if (widget.produtores.isNotEmpty) {
    _produtorSelecionado = widget.produtores[0];
  }
}
*/
  @override
  Widget build(BuildContext context) {
    print('Teste ${widget.produtores}');

    
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Propriedade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomePropriedadeController,
              decoration: const InputDecoration(labelText: 'Nome da Propriedade'),
            ),
            DropdownButton<Produtor>(
              hint: const Text('Selecione um Produtor'),
              value: _produtorSelecionado,
              onChanged: (Produtor? novoProdutor) {
                setState(() {
                  _produtorSelecionado = novoProdutor;
                });
              },
              items: widget.produtores.isNotEmpty
                  ? widget.produtores.map((Produtor produtor) {
                      return DropdownMenuItem<Produtor>(
                        value: produtor,
                        child: Text(produtor.nome),
                      );
                    }).toList()
                  : [
                      const DropdownMenuItem(
                        value: null,
                        child: Text('Nenhum produtor disponível'),
                      )
                  ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: ElevatedButton(
                onPressed: _salvarPropriedade,
                child: const Text('Salvar Propriedade'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
