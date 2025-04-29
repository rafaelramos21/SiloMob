import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
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
      appBar: AppBar(title: const Center(child: Text('Silo Manager'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Entrar'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () async {
                bool sucesso = await controller.validarLogin();
                if (sucesso) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Usuário ou senha incorretos')),
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
