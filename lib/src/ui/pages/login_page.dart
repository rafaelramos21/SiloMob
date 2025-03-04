import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/login_button.dart';
import '../../controllers/login_controller.dart';
import 'home_page.dart';

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
      appBar: AppBar(title: Center( child: Text('Silo Manager'))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/ScvcLogo.png'),
            ),
            const SizedBox(height: 50), 
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Usuário ou senha incorretos')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}