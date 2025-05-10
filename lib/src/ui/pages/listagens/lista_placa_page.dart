import 'package:flutter/material.dart';
import '../../../models/placa.dart';
import '../../../services/api_placa.dart';

class ListaPlacaPage extends StatefulWidget {
  const ListaPlacaPage({Key? key}) : super(key: key);

  @override
  ListaPlacaPageState createState() => ListaPlacaPageState();
}

class ListaPlacaPageState extends State<ListaPlacaPage> {
  final ApiPlaca apiPlaca = ApiPlaca();
  List<Placa> placaList = [];

  @override
  void initState() {
    super.initState();
    _carregarPlacas();
  }

  void _carregarPlacas() async {
    try {
      final lista = await apiPlaca.fetchPlacas();
      setState(() {
        placaList = lista;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar placas')),
      );
    }
  }

  void recarregarLista() {
    _carregarPlacas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Placas')),
      body: placaList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: placaList.length,
              itemBuilder: (context, index) {
                final p = placaList[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Placa:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          p.placa,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Modelo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          p.modelo,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
