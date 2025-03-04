import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/caminhao_page.dart';
import 'package:projetosilo/src/ui/pages/grupos_page.dart';
import 'package:projetosilo/src/ui/pages/lista_usuarios_page.dart';
import 'package:projetosilo/src/ui/pages/produtor_page.dart';
import 'package:projetosilo/src/ui/pages/propriedade_page.dart';
import 'package:projetosilo/src/ui/pages/talhao_page.dart';
import 'motorista_page.dart';
import '../../models/usuarios.dart';

class CadastroPage extends StatelessWidget{
  CadastroPage({super.key});

//Usuario Test
final List<Usuario> usuarios = [
    Usuario(nome: 'Rafael Ribeiro Ramos', cpf: '47567271826'),
    Usuario(nome: 'João Pedro Ruy', cpf: '12345678900'),
  ];

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
                    builder: (context) => ListaUsuariosPage(usuarios: usuarios),
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