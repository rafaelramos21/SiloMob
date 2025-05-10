import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/propriedade.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiPropriedade {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/propriedade/?expand=produtor';

  // Buscar todas as propriedades
  Future<List<Propriedade>> fetchPropriedades() async {
    final token = await TokenStorage.getToken();
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      String corrected = corrigirBytes(response.bodyBytes);
      List<dynamic> body = jsonDecode(corrected);
      return body.map((json) => Propriedade.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar propriedades: ${response.body}');
    }
  }

  // Adicionar uma propriedade
  Future<void> adicionarPropriedade(String nome, int produtorId) async {
    final token = await TokenStorage.getToken();
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
      'nome': nome,
      'produtor': produtorId, // <-- troque 'produtor_id' por 'produtor'
}),

    );

      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Erro ao cadastrar propriedade: ${response.body}');
    }
  }
}
