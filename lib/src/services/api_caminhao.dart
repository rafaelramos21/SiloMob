import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/caminhao.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiCaminhao {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/caminhao/?expand=motorista,placa';  // URL da API de Caminhões

  // Função para buscar todos os caminhões
  Future<List<Caminhao>> fetchCaminhoes() async {
    final token = await TokenStorage.getToken();  // Pegando o token de autenticação
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",  // Enviando o token na requisição
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      try {
        // Corrigir os bytes antes de decodificar
        String correctedResponse = corrigirBytes(response.bodyBytes);
        
        // Use correctedResponse para decodificar
        List<dynamic> body = jsonDecode(correctedResponse);
        
        return body.map((e) {
          return Caminhao.fromJson(e);
        }).toList();  // Retorna a lista de Caminhao
      } catch (e) {
        throw Exception('Erro ao decodificar a resposta JSON: $e');
      }
    } else {
      throw Exception('Erro ao carregar caminhões: ${response.body}');
    }
  }

  // Função para adicionar um caminhão
  Future<void> addCaminhao(Caminhao caminhao) async {
    final token = await TokenStorage.getToken();
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'modelo': caminhao.placa.modelo,  // Correção para acessar o campo correto
        'placa': caminhao.placa.placa,    // Correção para acessar o campo correto
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao adicionar caminhão: ${response.body}');
    }
  }
}
