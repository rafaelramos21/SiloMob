import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/caminhao_page.dart';
import 'package:projetosilo/src/ui/pages/produtor_page.dart';
import 'package:projetosilo/src/ui/pages/propriedade_page.dart';
import 'package:projetosilo/src/ui/pages/talhao_page.dart';
import 'package:projetosilo/src/ui/pages/placa_page.dart';
import 'motorista_page.dart';
import '../../models/produtor.dart';

class CadastroPage extends StatefulWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            _buildMenuButton(
              icon: Icons.person,
              label: 'Motoristas',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotoristaPage()),
                );
              },
            ),
            _buildMenuButton(
              icon: Icons.local_shipping,
              label: 'Caminhões',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaminhaoPage()),
                );
              },
            ),
            _buildMenuButton(
              icon: Icons.confirmation_number,
              label: 'Placas',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlacaPage()),
                );
              },
            ),
            _buildMenuButton(
              icon: Icons.agriculture,
              label: 'Produtores',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdutorPage()),
                );
              },
            ),
            _buildMenuButton(
              icon: Icons.home_work,
              label: 'Propriedades',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PropriedadePage()),
                );
              },
            ),
            _buildMenuButton(
              icon: Icons.landscape,
              label: 'Talhões',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TalhaoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
