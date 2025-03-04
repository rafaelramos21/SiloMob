import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/listagens/lista_motorista_page.dart';
import '../pages/cadastros/cadastro_motorista.dart';
import '../../models/motorista.dart';

class MotoristaPage extends StatefulWidget {
  const MotoristaPage({super.key});

  @override
  _MotoristaPageState createState() => _MotoristaPageState();
}

class _MotoristaPageState extends State<MotoristaPage> {
  List<Motorista> motoristas = [];

  void _atualizarListaMotoristas(Motorista motorista) {
    setState(() {
      motoristas.add(motorista);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motoristas'),
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
                    builder: (context) => ListaMotoristaPage(motoristasList: motoristas)
                  ),
                );
              },
              child: Text('Lista de Motoristas'),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                // Passa a função de atualização da lista para a página de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroMotoristaPage(onMotoristaAdicionado: _atualizarListaMotoristas),
                  ),
                );
              },
              child: const Text('Cadastrar Motorista'),
            ),
          ],
        ),
      ),
    );
  }
}
