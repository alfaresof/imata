import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/log_in/log_in_cubit.dart';

class LastReports extends StatelessWidget {
  static const String routename = '/LastReports';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routename),
        builder: (context) => LastReports()
    );
  }
  const LastReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Expolre'),
      ),
    );
  }
}
