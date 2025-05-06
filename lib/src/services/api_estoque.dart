import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/estoque_response.dart';
import '../utils/utf_correction.dart';
import '../utils/token_storage.dart';

class ApiEstoque {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/romaneio/get_estoque/'; // substitua pela URL real

  Future<EstoqueResponse> fetchEstoque() async {
    final token = await TokenStorage.getToken();
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      String correctedResponse = corrigirBytes(response.bodyBytes);
      final jsonData = jsonDecode(correctedResponse);
      return EstoqueResponse.fromJson(jsonData);
    } else {
      throw Exception('Erro ao carregar dados de estoque: ${response.body}');
    }
  }
}
