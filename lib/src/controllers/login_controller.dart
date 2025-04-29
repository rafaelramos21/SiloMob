import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  String usuario = '';
  String senha = '';

  // 👉 Faz a requisição para a API e valida
  Future<bool> validarLogin() async {
    final url = Uri.parse('https://silo-qk3e.onrender.com/api/token/');
    
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": usuario,
        "password": senha,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final token = body['access']; // ou body['token'], depende da resposta do seu Django

      // Salva o token no celular
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      return true;
    } else {
      // Se usuário ou senha errados
      return false;
    }
  }
}
