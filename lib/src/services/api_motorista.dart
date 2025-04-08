import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motorista.dart';

class ApiMotorista {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/motorista/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNTcwMjAxLCJpYXQiOjE3NDM1NTIyMDEsImp0aSI6ImM3NWFlYjIyZDJlZDQ4ZmU4OTA2NjNhOTFjMzVlMDFjIiwidXNlcl9pZCI6MX0.IPT4mod4DorNZZptvRsRsdrKW_F3tWx0v4AxVF3frhk';

  // 🔹 Buscar lista de motoristas
  Future<List<Motorista>> fetchMotoristas() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Motorista.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar motoristas: ${response.body}');
    }
  }

  // 🔹 Criar motorista na API
  Future<bool> createMotorista(Motorista motorista) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $token",
      },
      body: jsonEncode(motorista.toJson()),
    );

    return response.statusCode == 201;
  }
}
