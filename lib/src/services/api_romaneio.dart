import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/romaneio.dart';
import '../models/romaneio_pagination.dart';
import '../utils/utf_correction.dart';
import '../utils/token_storage.dart';

class ApiTicket {
  final String baseUrl = 'https://silo-qk3e.onrender.com/api/romaneio/?expand=user,talhao';

  Future<List<Romaneio>> fetchTickets() async {
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
      return body.map((e) => Romaneio.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar tickets: ${response.body}');
    }
  }

  Future<PaginatedRomaneio> fetchPaginatedTickets({
    required int offset,
    required int limit,
  }) async {
    final token = await TokenStorage.getToken();
    final url = '$baseUrl&limit=$limit&offset=$offset';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      String correctedResponse = corrigirBytes(response.bodyBytes);
      final jsonData = jsonDecode(correctedResponse);
      return PaginatedRomaneio.fromJson(jsonData);
    } else {
      throw Exception('Erro ao carregar tickets paginados: ${response.body}');
    }
  }
}
