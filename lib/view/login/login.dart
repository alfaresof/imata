import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/log_in/log_in_cubit.dart';
import 'package:imata/bloc/register/register_cubit.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/text.dart';
import 'package:imata/comp/textfield.dart';
import 'package:imata/repo/auth/auth_repo.dart';
import 'package:imata/view/home/home_page.dart';
import 'package:imata/view/last_reports/last_report.dart';
import 'package:imata/view/register/register.dart';

class LogIn extends StatelessWidget {
  static const String routename = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (context) => LogIn()
    );
  }
  //
  // BlocProvider(
  // create: (_) => LogInCubit(authRepositry: context.read<AuthRepositry>()),
  // child: LogIn(),
  // ),
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/robot.png'),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text('Log In', 30, FontWeight.w900, Colors.black87,
                            TextAlign.left),
                        SizedBox(
                          height: 30,
                        ),
                        // CustomTextFormField('name', (value) {
                        //   context.read<RegisterCubit>().passwordChanged(value);
                        //   print(state.email);
                        // }),

                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 6.0),
                          child: text('E-mail', 20, FontWeight.bold, blackGreen,
                              TextAlign.left),
                        ),
                        CustomTextFormField('email', (value) {
                          context.read<LogInCubit>().emailChanged(value);
                          print(state.email);
                        }, false),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 6.0),
                          child: text('Password', 20, FontWeight.bold,
                              blackGreen, TextAlign.left),
                        ),
                        CustomTextFormField('password', (value) {
                          context.read<LogInCubit>().passwordChanged(value);
                        }, true),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                            ),
                            child: text('try it !', 20, FontWeight.bold,
                                Colors.white, TextAlign.center),
                            onPressed: () {
                              if (state.isValid) {
                                context
                                    .read<LogInCubit>()
                                    .logInWithCredentials();
                                print(state.id);
                                print('here');
                                Navigator.pushNamed(context, HomePage.routename);
                                if(state.status == LogInStatus.success){
                                  print('here');

                                }
                              } else {
                                print('nice error');
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Register.routename);
                          },
                          child: text(
                              'new member ? Sign Up',
                              15,
                              FontWeight.normal,
                              Colors.black87,
                              TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
