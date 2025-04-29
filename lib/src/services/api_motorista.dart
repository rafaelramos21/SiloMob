import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motorista.dart';
import '../utils/token_storage.dart';
import '../utils/utf_correction.dart';

class ApiMotorista {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/motorista/';

  // 🔹 Buscar lista de motoristas
  Future<List<Motorista>> fetchMotoristas() async {
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

      List<dynamic> body = jsonDecode(correctedResponse);
      return body.map((e) => Motorista.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar motoristas: ${response.body}');
    }
  }

  // 🔹 Criar motorista na API
  Future<bool> createMotorista(Motorista motorista) async {
    final token = await TokenStorage.getToken();
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(motorista.toJson()),
    );

    return response.statusCode == 201;
  }
}
