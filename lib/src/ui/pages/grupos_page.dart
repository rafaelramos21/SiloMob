import 'package:flutter/material.dart';

class GruposPage extends StatelessWidget{
  const GruposPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Grupos',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}