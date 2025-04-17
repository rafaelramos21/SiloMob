import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/romaneio.dart';

class ApiTicket {
  final String baseUrl = 'http://127.0.0.1:8000/api/romaneio/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0OTE0MzEwLCJpYXQiOjE3NDQ4OTYzMTAsImp0aSI6ImMyMWU5MWNhYjBiZDQ3MDg4MDRlMjFhNGU4YTVmNDdlIiwidXNlcl9pZCI6MX0.BOc0lPTziqnAXoh8Xx8Sg4gXddV2Tk2Xsylgj7copIM';

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
