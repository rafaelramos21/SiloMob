import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/produtor.dart';

class ApiProdutor {
  final String baseUrl = 'http://127.0.0.1:8000/api/produtor/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0MzkwMzM2LCJpYXQiOjE3NDQzNzIzMzYsImp0aSI6ImQyY2EyNjVlNWUwNDQ0OTliNjM2ZDUxN2NiNDA5ZmQxIiwidXNlcl9pZCI6MX0.bDC-6Y154xx-F36yAt4adFwEOjPQRcDlwPzbHOJXfIw';

  Future<List<Produtor>> fetchProdutores() async {
  final response = await http.get(Uri.parse(baseUrl), headers: {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
    return body.map((json) => Produtor.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar produtores');
  }
}

  Future<void> adicionarProdutor(String nome) async {
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({'nome': nome}),
  );

  if (response.statusCode != 201) {
    throw Exception('Erro ao cadastrar produtor');
  }
}
}
