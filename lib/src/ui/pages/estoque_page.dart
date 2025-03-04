import 'package:flutter/material.dart';

class EstoquePage extends StatelessWidget {
  const EstoquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Estoque',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
