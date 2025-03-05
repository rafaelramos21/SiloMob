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
    final produtores = Provider.of<ProdutorProvider>(context).produtores; // Busca os produtores globais

    return Scaffold(
      appBar: AppBar(
        title: const Text('Propriedades'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaPropriedadesPage(propriedades: propriedades),
                  ),
                );
              },
              child: const Text('Lista de Propriedades'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
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
                      produtores: produtores, // Agora a lista de produtores vem do Provider
                    ),
                  ),
                );
              },
              child: const Text('Cadastrar Propriedade'),
            ),
          ],
        ),
      ),
    );
  }
}
