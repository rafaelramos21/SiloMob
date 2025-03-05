import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_produtor_page.dart';
import '../pages/cadastros/cadastro_produtor.dart';

class ProdutorPage extends StatelessWidget {
  const ProdutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtores'),
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
                    builder: (context) => ListaProdutorPage(),
                  ),
                );
              },
              child: const Text('Lista de Produtores'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de cadastro de produtores
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroProdutorPage(),
                  ),
                );
              },
              child: const Text('Cadastrar Produtor'),
            ),
          ],
        ),
      ),
    );
  }
}
