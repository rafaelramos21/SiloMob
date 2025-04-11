import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_caminhao_page.dart';
import '../pages/cadastros/cadastro_caminhao.dart';
import '../../models/caminhao.dart';

class CaminhaoPage extends StatefulWidget{
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaCaminhaoPage(caminhaoList: caminhoes)
                  ),
                );
              },
              child: Text('Lista de Caminhões'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                // Passa a função de atualização da lista para a página de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroCaminhaoPage(onCaminhaoAdicionado: _atualizarListaCaminhao),
                  ),
                );
              },
              child: const Text('Cadastrar Caminhões'),
            ),
          ],
        ),
      ),
    );
  }
}