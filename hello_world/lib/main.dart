import 'package:flutter/material.dart';
import 'package:hello_world/screen/Homepage.dart';
import 'package:hello_world/screen/loginpage.dart';
import 'package:hello_world/screen/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(fontFamily: "Poppins"))),
      home: const LoginPage(),
    );
  }
}
