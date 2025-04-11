import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_motorista_page.dart';
import '../pages/cadastros/cadastro_motorista.dart';

class MotoristaPage extends StatelessWidget {
  const MotoristaPage({super.key});

  void _atualizarListaMotoristas(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ListaMotoristaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motoristas'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.list_alt),
              label: Text('Lista de Motoristas'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaMotoristaPage()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.person_add_alt_1),
              label: Text('Cadastrar Motorista'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220, 60),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroMotoristaPage(
                      onMotoristaAdicionado: () => _atualizarListaMotoristas(context),
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
