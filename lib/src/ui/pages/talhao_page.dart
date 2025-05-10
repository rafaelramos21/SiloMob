import 'package:flutter/material.dart';
import '/src/services/api_talhao.dart';
import '../../models/propriedade.dart';
import '../../models/talhao.dart';
import '../../services/api_propriedade.dart';
import 'cadastros/cadastro_talhao.dart';
import 'listagens/lista_talhao_page.dart';

class TalhaoPage extends StatefulWidget {
  const TalhaoPage({Key? key}) : super(key: key);

  @override
  _TalhaoPageState createState() => _TalhaoPageState();
}

class _TalhaoPageState extends State<TalhaoPage> {
  late Future<List<Propriedade>> _propriedades;
  late Future<List<Talhao>> _talhoes;

  @override
  void initState() {
    super.initState();
    _carregarPropriedades();
    _carregarTalhoes();
  }

  void _carregarPropriedades() {
    _propriedades = ApiPropriedade().fetchPropriedades();
  }

  void _carregarTalhoes() {
    _talhoes = ApiTalhao().fetchTalhoes();
  }

  void _atualizarLista() {
    setState(() {
      _carregarPropriedades();
      _carregarTalhoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talhões'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.list_alt),
              label: Text('Lista de Talhões'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                final propriedades = await _propriedades;
                final talhoes = await _talhoes;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaTalhaoPage(talhoes: talhoes, propriedades: propriedades),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add_box),
              label: Text('Cadastrar Talhão'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                final propriedades = await _propriedades;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroTalhaoPage(
                      propriedades: propriedades,
                      onTalhaoAdicionado: _atualizarLista,
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
