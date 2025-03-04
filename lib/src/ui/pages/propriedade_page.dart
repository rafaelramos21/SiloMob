import 'package:flutter/material.dart';

class PropriedadePage extends StatelessWidget{
  const PropriedadePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propriedades'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Propriedades',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}