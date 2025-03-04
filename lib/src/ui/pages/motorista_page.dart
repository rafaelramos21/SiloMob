import 'package:flutter/material.dart';

class MotoristaPage extends StatelessWidget {
  const MotoristaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motoristas'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Motorista',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
