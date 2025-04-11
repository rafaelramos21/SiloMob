import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_propriedade_page.dart';
import '../pages/cadastros/cadastro_propriedade.dart';
import '../../models/propriedade.dart';
import '../../controllers/produtor_provider.dart'; // Importa o Provider

class PropriedadePage extends StatefulWidget {
  const PropriedadePage({super.key});

  @override
  _PropriedadePageState createState() => _PropriedadePageState();
}

class _PropriedadePageState extends State<PropriedadePage> {
  List<Propriedade> propriedades = [];

  void _atualizarListaPropriedade(Propriedade propriedade) {
    setState(() {
      propriedades.add(propriedade);
    });
  }

  @override
  Widget build(BuildContext context) {
    final produtores = Provider.of<ProdutorProvider>(context).produtores;

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
              icon: const Icon(Icons.list_alt),
              label: const Text('Lista de Propriedades'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaPropriedadesPage(propriedades: propriedades),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_home_work), // ícone relacionado a propriedade/terra
              label: const Text('Cadastrar Propriedade'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                if (produtores.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cadastre um produtor primeiro!')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroPropriedadePage(
                      onPropriedadeAdicionada: _atualizarListaPropriedade,
                      produtores: produtores,
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
