import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/caminhao_page.dart';
import 'package:projetosilo/src/ui/pages/grupos_page.dart';
import 'package:projetosilo/src/ui/pages/produtor_page.dart';
import 'package:projetosilo/src/ui/pages/propriedade_page.dart';
import 'package:projetosilo/src/ui/pages/talhao_page.dart';
import 'package:projetosilo/src/ui/pages/usuario_page.dart';
import 'package:projetosilo/src/ui/pages/placa_page.dart';
import 'motorista_page.dart';
import '../../models/produtor.dart';

class CadastroPage extends StatefulWidget{
  final List<Produtor> produtores;

  const CadastroPage({Key? key, required this.produtores}) : super(key: key);
  
   @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastros'),
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
                    builder: (context) => MotoristaPage(),
                  ),
                );
              },
              child: Text('Motoristas'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaminhaoPage()
                  ),
                );
              },
              child: Text('Caminhões'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacaPage()
                  ),
                );
              },
              child: Text('Placas'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdutorPage()
                  ),
                );
              },
              child: Text('Produtores'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PropriedadePage()
                  ),
                );
              },
              child: Text('Propriedades'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TalhaoPage()
                  ),
                );
              },
              child: Text('Talhões'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsuarioPage()
                  ),
                );
              },
              child: Text('Usuários'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GruposPage()
                  ),
                );
              },
              child: Text('Grupos'),
            ),
          ],
        ),
      ),
    );
  }
}