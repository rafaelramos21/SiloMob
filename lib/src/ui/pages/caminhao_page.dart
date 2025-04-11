import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_caminhao_page.dart';
import '../pages/cadastros/cadastro_caminhao.dart';
import '../../models/caminhao.dart';

class CaminhaoPage extends StatefulWidget {
  const CaminhaoPage({super.key});

  @override
  _CaminhaoPageState createState() => _CaminhaoPageState();
}

class _CaminhaoPageState extends State<CaminhaoPage> {
  List<Caminhao> caminhoes = [];

  void _atualizarListaCaminhao(Caminhao caminhao) {
    setState(() {
      caminhoes.add(caminhao);
    });
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
              icon: Icon(Icons.list_alt),
              label: Text('Lista de Caminhões'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaCaminhaoPage(caminhaoList: caminhoes),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add_box),
              label: Text('Cadastrar Caminhão'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroCaminhaoPage(
                      onCaminhaoAdicionado: _atualizarListaCaminhao,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
