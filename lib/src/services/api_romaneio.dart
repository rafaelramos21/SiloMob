import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/romaneio.dart';

class ApiTicket {
  final String baseUrl = 'http://127.0.0.1:8000/api/romaneio/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0NDI4NjAwLCJpYXQiOjE3NDQ0MTA2MDAsImp0aSI6IjViOWRmNTk1MzQ3MDQyZjA5OTdlNGI1YmRiMDIzMGJkIiwidXNlcl9pZCI6MX0.PZbwcDBjRQNRmTOnZCoDBcNwE62DoPDONeCnpxKNuNA';

  Future<List<Romaneio>> fetchTickets() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type" : "application/json;charset=utf-8"
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Romaneio.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar tickets: ${response.body}');
    }
  }
}
