import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/register/register_cubit.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/text.dart';
import 'package:imata/comp/textfield.dart';
import 'package:imata/repo/auth/auth_repo.dart';
import 'package:imata/view/login/login.dart';

class Register extends StatelessWidget {
  static const String routename = '/signup';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (context) => const Register(),
    );
  }

  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<RegisterCubit, RegisterState>(
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
                        text('Sign Up', 30, FontWeight.w900, Colors.black87,
                            TextAlign.left),
                        SizedBox(
                          height: 30,
                        ),
                        // CustomTextFormField('name', (value) {
                        //   context.read<RegisterCubit>().passwordChanged(value);
                        //   print(state.email);
                        // }),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 8.0, bottom: 6.0),
                          child: text('Name', 20, FontWeight.bold, blackGreen,
                              TextAlign.left),
                        ),
                        CustomTextFormField('name', (value) {
                          context.read<RegisterCubit>().nameChange(value);
                          print(state.email);
                        }, false),
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
                          context.read<RegisterCubit>().emailChanged(value);
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
                          context.read<RegisterCubit>().passwordChanged(value);
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
                                    .read<RegisterCubit>()
                                    .registerWithCredentials();
                              } else {
                                print('nice error');
                              }
                            },
                          ),
                        ),
                        new GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LogIn.routename);
                          },
                          child: text(
                              'Already have an account ? LogIn',
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
