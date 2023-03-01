import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/log_in/log_in_cubit.dart';
import 'package:imata/bloc/register/register_cubit.dart';
import 'package:imata/config/router.dart';
import 'package:imata/repo/auth/auth_repo.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositry(),
        ),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LogInCubit(authRepositry: context.read<AuthRepositry>()),
          ),
          BlocProvider(
            create: (context) =>  RegisterCubit(authRepositry: context.read<AuthRepositry>()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: '/',

          // routes: {
          //   '/': (context) => const HomePage(),
          //   '/login': (context) => const Login(),
          //   '/register': (context) =>  Register(),
          //   '/thank': (context) => const Thank(),
          // },
        ),
      ),
    );
  }
}
