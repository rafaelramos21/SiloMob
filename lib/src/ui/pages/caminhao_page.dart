import 'package:flutter/material.dart';

class CaminhaoPage extends StatelessWidget{
  const CaminhaoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caminhões'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Caminhões',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}