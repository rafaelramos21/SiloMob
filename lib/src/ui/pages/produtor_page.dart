import 'package:flutter/material.dart';
import 'listagens/lista_produtor_page.dart';
import 'cadastros/cadastro_produtor.dart';

class ProdutorPage extends StatelessWidget {
  const ProdutorPage({super.key});

  void _atualizarListaProdutores(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ListaProdutorPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtores'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaProdutorPage()));
              },
              child: Text('Lista de Produtores'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroProdutorPage(onProdutorAdicionado: () => _atualizarListaProdutores(context)),
                  ),
                );
              },
              child: Text('Cadastrar Produtor'),
            ),
          ],
        ),
      ),
    );
  }
}
