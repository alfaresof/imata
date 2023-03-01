import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imata/repo/auth/auth_repo.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthRepositry _authRepositry;
  LogInCubit({required AuthRepositry authRepositry})
      : _authRepositry = authRepositry,
        super(LogInState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LogInStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LogInStatus.initial));
  }

  void logInWithCredentials() async {
    if (!state.isValid) return;
    try {
     var a = await _authRepositry.LogIn(email: state.email, password: state.password);
     print('sssssssssssssssssssssssssssssssssssssssss');
     print('id : ${a!.uid}');
     emit(await state.copyWith(id: a!.uid));
     emit(await state.copyWith(status: LogInStatus.success));

    } catch (e) {
      print('nice error');
    }
  }
}
