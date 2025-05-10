import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/talhao.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiTalhao {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/talhao/?expand=propriedade';

  // Função para buscar todos os talhões
  Future<List<Talhao>> fetchTalhoes() async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      String corrected = corrigirBytes(response.bodyBytes);  // Corrigindo os bytes da resposta
      List<dynamic> body = jsonDecode(corrected);
      print(body);
      return body.map((json) => Talhao.fromJson(json)).toList();  // Retorna a lista de Talhões
    } else {
      throw Exception('Falha ao carregar talhões: ${response.body}');
    }
  }

  // Função para adicionar um talhão
  Future<void> adicionarTalhao(String nome, int propriedadeId) async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'nome': nome,
        'propriedade': propriedadeId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao cadastrar talhão: ${response.body}');
    }
  }
}
