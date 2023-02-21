import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imata/bloc/register/register_cubit.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/text.dart';
import 'package:imata/comp/textfield.dart';
import 'package:imata/repo/auth_repo.dart';

class Register extends StatelessWidget {
  static const String routename = '/signup';

  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routename),
      builder: (context) => BlocProvider(
        create: (_)=> RegisterCubit(authRepositry: context.read<AuthRepositry>()),
        child: Register(),
      ),
    );
  }

  const Register({Key ?key}) : super(key: key);

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
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          text('Sign Up', 30, FontWeight.bold, Colors.black87,
                              TextAlign.left),
                          SizedBox(height: 20,),
                          // CustomTextFormField('name', (value) {
                          //   context.read<RegisterCubit>().passwordChanged(value);
                          //   print(state.email);
                          // }),
                          CustomTextFormField('email', (value) {
                            context.read<RegisterCubit>().emailChanged(value);
                            print(state.email);
                          }),

                          CustomTextFormField('password', (value) {
                            context.read<RegisterCubit>().passwordChanged(value);
                          }),

                          TextFormField(
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Type in your text",
                                fillColor: lightyGreen),
                            // controller: ,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(

                              backgroundColor: darkGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                            ),
                            child: text('try it !',20,FontWeight.bold,Colors.white,TextAlign.center),
                            onPressed: () {
                              context.read<RegisterCubit>().registerWithCredentials();
                            },
                          )

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
