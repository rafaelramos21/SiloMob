import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/romaneio.dart';

class ApiTicket {
  final String baseUrl = 'http://127.0.0.1:8000/api/romaneio/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0MzkwMzM2LCJpYXQiOjE3NDQzNzIzMzYsImp0aSI6ImQyY2EyNjVlNWUwNDQ0OTliNjM2ZDUxN2NiNDA5ZmQxIiwidXNlcl9pZCI6MX0.bDC-6Y154xx-F36yAt4adFwEOjPQRcDlwPzbHOJXfIw';

  Future<List<Romaneio>> fetchTickets() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
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
