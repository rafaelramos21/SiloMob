import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_placa_page.dart';
import '../pages/cadastros/cadastro_placa.dart';

class PlacaPage extends StatelessWidget {
  const PlacaPage({super.key});

  void _atualizarListaPlacas(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ListaPlacaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Placas'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListaPlacaPage()));
              },
              child: const Text('Lista de Placas'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroPlacaPage(
                      onPlacaAdicionada: () => _atualizarListaPlacas(context),
                    ),
                  ),
                );
              },
              child: const Text('Cadastrar Placa'),
            ),
          ],
        ),
      ),
    );
  }
}
