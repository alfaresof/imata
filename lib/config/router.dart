

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imata/view/home/home_page.dart';
import 'package:imata/view/register/register.dart';

class AppRouter{


  static Route onGenerateRoute(RouteSettings settings){
    print('the router setting ${settings.name}');

    switch (settings.name){
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => HomePage(),
        );
      case Register.routename:
        return Register.route();
      default:
        return _errorRoute();

    }

    
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      builder: (_)=> Scaffold(appBar: AppBar(title: Text('error'),),),
      settings: RouteSettings(name:'/error'),);
  }


}