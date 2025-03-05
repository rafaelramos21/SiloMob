import 'package:flutter/material.dart';
import 'package:projetosilo/src/ui/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'src/controllers/produtor_provider.dart';
//import 'package:projetosilo/src/ui/pages/home_page.dart';

void main() {
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProdutorProvider()),
    ],
    child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silo Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue
        ),
        scaffoldBackgroundColor: Colors.grey[400],
        appBarTheme: AppBarTheme(
          color: Colors.lightGreen,
          elevation: 4,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}