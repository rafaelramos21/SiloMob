import 'package:flutter/material.dart';

class ProdutorPage extends StatelessWidget{
  const ProdutorPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtores'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Produtores',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}