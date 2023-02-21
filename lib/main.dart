import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/register/register_cubit.dart';
import 'package:imata/config/router.dart';
import 'package:imata/repo/auth_repo.dart';
import 'package:imata/view/home/home_page.dart';
import 'package:imata/view/login/login.dart';
import 'package:imata/view/register/register.dart';
import 'package:imata/view/thank/thank.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositry(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Register.routename,

        // routes: {
        //   '/': (context) => const HomePage(),
        //   '/login': (context) => const Login(),
        //   '/register': (context) =>  Register(),
        //   '/thank': (context) => const Thank(),
        // },
      ),
    );
  }
}
