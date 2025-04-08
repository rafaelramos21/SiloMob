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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaMotoristaPage()));
              },
              child: Text('Lista de Motoristas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroMotoristaPage(onMotoristaAdicionado: () => _atualizarListaMotoristas(context)),
                  ),
                );
              },
              child: Text('Cadastrar Motorista'),
            ),
          ],
        ),
      ),
    );
  }
}
