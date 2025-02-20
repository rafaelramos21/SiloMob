import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/login_button.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(
              label: 'Usuário',
              onChanged: (value) => controller.usuario = value,
            ),
            InputField(
              label: 'Senha',
              obscureText: true,
              onChanged: (value) => controller.senha = value,
            ),
            SizedBox(height: 20),
            LoginButton(
              onPressed: () {
                if (controller.validarLogin()) {
                  print('Login bem-sucedido!');
                } else {
                  print('Usuário ou senha incorretos');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}