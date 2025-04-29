import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/placa.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiPlaca {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/placa/';

  // Função para buscar todas as placas
  Future<List<Placa>> fetchPlacas() async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",  // Enviando o token na requisição
      },
    );

    if (response.statusCode == 200) {
      try {
        // Corrigir os bytes antes de decodificar
        String correctedResponse = corrigirBytes(response.bodyBytes);
        
        // Usando correctedResponse para decodificar
        List<dynamic> body = jsonDecode(correctedResponse);
        
        return body.map((e) {
          return Placa.fromJson(e);
        }).toList();  // Retorna a lista de Placa
      } catch (e) {
        throw Exception('Erro ao decodificar a resposta JSON: $e');
      }
    } else {
      throw Exception('Erro ao carregar placas: ${response.body}');
    }
  }

  // Função para adicionar uma placa
  Future<bool> createPlaca(Placa placa) async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",  // Enviando o token na requisição
      },
      body: jsonEncode(placa.toJson()),  // Usando o método toJson da Placa
    );

    if (response.statusCode == 201) {
      return true;  // Retorna true se o status da resposta for 201
    } else {
      throw Exception('Erro ao adicionar placa: ${response.body}');
    }
  }
}
