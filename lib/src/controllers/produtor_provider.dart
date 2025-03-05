import 'package:flutter/material.dart';
import '../models/produtor.dart';

class ProdutorProvider extends ChangeNotifier {
  final List<Produtor> _produtores = [];

  List<Produtor> get produtores => _produtores;

  void adicionarProdutor(Produtor produtor) {
    _produtores.add(produtor);
    notifyListeners();
  }
}
