import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imata/view/home/home_page.dart';
import 'package:imata/view/last_reports/last_report.dart';
import 'package:imata/view/login/login.dart';
import 'package:imata/view/register/register.dart';
import 'package:imata/view/report/new_report.dart';
import 'package:imata/view/report/report.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('the router setting ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const HomePage(),
        );
      case Register.routename:
        return Register.route();
      case LogIn.routename:
        return LogIn.route();
      case HomePage.routename:
        return HomePage.route();
      case NewReport.routename:
        return NewReport.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
