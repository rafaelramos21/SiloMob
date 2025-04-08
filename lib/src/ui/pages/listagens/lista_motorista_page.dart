import 'package:flutter/material.dart';
import '../../../models/motorista.dart';
import '../../../services/api_motorista.dart';

class ListaMotoristaPage extends StatefulWidget {
  @override
  _ListaMotoristaPageState createState() => _ListaMotoristaPageState();
}

class _ListaMotoristaPageState extends State<ListaMotoristaPage> {
  final ApiMotorista apiMotorista = ApiMotorista();
  List<Motorista> motoristasList = [];

  @override
  void initState() {
    super.initState();
    _carregarMotoristas();
  }

  void _carregarMotoristas() async {
    try {
      List<Motorista> motoristas = await apiMotorista.fetchMotoristas();
      setState(() {
        motoristasList = motoristas;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar motoristas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Motoristas')),
      body: motoristasList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: motoristasList.length,
              itemBuilder: (context, index) {
                final motorista = motoristasList[index];
                return ListTile(
                  title: Center(child: Text(motorista.nome)),
                );
              },
            ),
    );
  }
}
