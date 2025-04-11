import 'package:flutter/material.dart';
import '../../../models/produtor.dart';
import '../../../services/api_produtor.dart';

class ListaProdutorPage extends StatefulWidget {
  const ListaProdutorPage({Key? key}) : super(key: key);

  @override
  State<ListaProdutorPage> createState() => _ListaProdutorPageState();
}

class _ListaProdutorPageState extends State<ListaProdutorPage> {
  final ApiProdutor apiProdutor = ApiProdutor();
  List<Produtor> produtores = [];

  @override
  void initState() {
    super.initState();
    _carregarProdutores();
  }

  void _carregarProdutores() async {
    try {
      final lista = await apiProdutor.fetchProdutores();
      setState(() {
        produtores = lista;
      });
    } catch (e) {
      print('Erro ao buscar produtores: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao carregar produtores')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Produtores')),
      body: produtores.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: produtores.length,
              itemBuilder: (context, index) {
                final p = produtores[index];
                return ListTile(
                  title: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nome:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(p.nome),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
