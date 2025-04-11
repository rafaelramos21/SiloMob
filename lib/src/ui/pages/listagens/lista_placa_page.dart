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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao carregar placas')));
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
              itemCount: placaList.length,
              itemBuilder: (context, index) {
                final p = placaList[index];
                return ListTile(
                  title: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Placa: ${p.placa}', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Modelo: ${p.modelo}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
