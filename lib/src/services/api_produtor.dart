import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/produtor.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiProdutor {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/produtor/';

  // Função para buscar todos os produtores
  Future<List<Produtor>> fetchProdutores() async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      try {
        // Corrigir os bytes antes de decodificar
        String correctedResponse = corrigirBytes(response.bodyBytes);

        // Usando correctedResponse para decodificar
        List<dynamic> body = jsonDecode(correctedResponse);

        return body.map((json) => Produtor.fromJson(json)).toList();  // Retorna a lista de Produtores
      } catch (e) {
        throw Exception('Erro ao decodificar a resposta JSON: $e');
      }
    } else {
      throw Exception('Falha ao carregar produtores: ${response.body}');
    }
  }

  // Função para adicionar um produtor
  Future<void> adicionarProdutor(String nome) async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',  // Enviando o token na requisição
      },
      body: jsonEncode({'nome': nome}),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao cadastrar produtor: ${response.body}');
    }
  }
}
