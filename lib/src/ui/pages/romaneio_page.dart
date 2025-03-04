import 'package:flutter/material.dart';

class RomaneioPage extends StatelessWidget {
  const RomaneioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Romaneio'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Romaneio',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
