import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/placa.dart';

class ApiPlaca {
  final String baseUrl = 'http://127.0.0.1:8000/api/placa/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0NDI4NjAwLCJpYXQiOjE3NDQ0MTA2MDAsImp0aSI6IjViOWRmNTk1MzQ3MDQyZjA5OTdlNGI1YmRiMDIzMGJkIiwidXNlcl9pZCI6MX0.PZbwcDBjRQNRmTOnZCoDBcNwE62DoPDONeCnpxKNuNA';

  Future<List<Placa>> fetchPlacas() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Placa.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar placas: ${response.body}');
    }
  }

  Future<bool> createPlaca(Placa placa) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(placa.toJson()),
    );
    return response.statusCode == 201;
  }
}
