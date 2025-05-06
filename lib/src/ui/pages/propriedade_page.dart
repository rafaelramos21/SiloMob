import 'package:flutter/material.dart';
import '../../models/propriedade.dart';
import '../../models/produtor.dart';
import '../../services/api_propriedade.dart';
import '../../services/api_produtor.dart';
import 'cadastros/cadastro_propriedade.dart';
import 'listagens/lista_propriedade_page.dart';

class PropriedadePage extends StatefulWidget {
  const PropriedadePage({Key? key}) : super(key: key);

  @override
  _PropriedadePageState createState() => _PropriedadePageState();
}

class _PropriedadePageState extends State<PropriedadePage> {
  late Future<List<Propriedade>> _propriedades;
  late Future<List<Produtor>> _produtores;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() {
    _propriedades = ApiPropriedade().fetchPropriedades();
    _produtores = ApiProdutor().fetchProdutores(); // Certifique-se de ter esse método implementado
  }

  void _atualizarLista() {
    setState(() {
      _carregarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propriedades'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Lista de Propriedades'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _propriedades.then((lista) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaPropriedadesPage(propriedades: lista),
                    ),
                  );
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Cadastrar Propriedade'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                final produtores = await ApiProdutor().fetchProdutores();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroPropriedadePage(
                      produtores: produtores,
                      onPropriedadeAdicionada: _atualizarLista,
                    ),
                  ),
                );
              },
            ),  
          ],
        ),
      ),
    );
  }
}
