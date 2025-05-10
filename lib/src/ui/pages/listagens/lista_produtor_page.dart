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
      appBar: AppBar(title: const Text('Lista de Produtores')),
      body: produtores.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: produtores.length,
              itemBuilder: (context, index) {
                final p = produtores[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adiciona espaço entre os cards
                  elevation: 4, // Dá uma leve sombra ao card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Faz as bordas do card arredondadas
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16), // Espaçamento interno
                    title: Text(
                      p.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
