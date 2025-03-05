import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/produtor_provider.dart';

class ListaProdutorPage extends StatelessWidget {
  const ListaProdutorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acessa a lista de produtores diretamente do Provider
    final produtoresList = Provider.of<ProdutorProvider>(context).produtores;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtores'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: produtoresList.length,
        itemBuilder: (context, index) {
          final produtor = produtoresList[index];
          return ListTile(
            title: Center(
              child: Text(produtor.nome),
            ),
            subtitle: Center(
              child: Text('Propriedade(s): ${produtor.propriedade}'),
            ),
          );
        },
      ),
    );
  }
}
