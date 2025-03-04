import 'package:flutter/material.dart';
import 'login_page.dart';
import 'romaneio_page.dart';
import 'estoque_page.dart';
import 'cadastro_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? Key}) : super(key: Key);

  //Usuarios Teste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silo Manager'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroPage(),
                ),
              );
            },
            child: Text('Cadastros'),
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RomaneioPage()
                ),
              );
            },
            child: Text('Romaneio'),
            ),
            SizedBox(height: 16,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstoquePage()
                ),
              );
            },
            child: Text('Estoque'),
            ),
          ],
        ),
      ),
    );
  }
}
