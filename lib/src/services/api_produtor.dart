import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/produtor.dart';

class ApiProdutor {
  final String baseUrl = 'http://127.0.0.1:8000/api/produtor/';
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0OTE0MzEwLCJpYXQiOjE3NDQ4OTYzMTAsImp0aSI6ImMyMWU5MWNhYjBiZDQ3MDg4MDRlMjFhNGU4YTVmNDdlIiwidXNlcl9pZCI6MX0.BOc0lPTziqnAXoh8Xx8Sg4gXddV2Tk2Xsylgj7copIM';

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
