import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
