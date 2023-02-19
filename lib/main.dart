import 'package:flutter/material.dart';
import 'package:imata/view/home/home_page.dart';
import 'package:imata/view/login/login.dart';
import 'package:imata/view/register/register.dart';
import 'package:imata/view/thank/thank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/register':(context) =>  const Register(),
        '/thank': (context) => const Thank(),
      },
    );
  }
}
