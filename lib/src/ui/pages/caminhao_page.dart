import 'package:flutter/material.dart';
import '../../services/api_caminhao.dart';
import '../../models/caminhao.dart';
import 'listagens/lista_caminhao_page.dart';

class CaminhaoPage extends StatefulWidget {
  const CaminhaoPage({Key? key}) : super(key: key);

  @override
  _CaminhaoPageState createState() => _CaminhaoPageState();
}

class _CaminhaoPageState extends State<CaminhaoPage> {
  late Future<List<Caminhao>> _caminhoes;

  @override
  void initState() {
    super.initState();
    _caminhoes = ApiCaminhao().fetchCaminhoes();  // Chama a API para buscar os caminhões
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caminhões'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.list_alt),
              label: const Text('Lista de Caminhões'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaCaminhaoPage(caminhaoFuture: _caminhoes),  // Passa a Future para a lista
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_box),
              label: const Text('Cadastrar Caminhão'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                // Navegar para a página de cadastro de caminhão
              },
            ),
          ],
        ),
      ),
    );
  }
}
