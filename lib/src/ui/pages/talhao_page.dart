import 'package:flutter/material.dart';

class TalhaoPage extends StatelessWidget{
  const TalhaoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talhões'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Talhões',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}