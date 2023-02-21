import 'package:bloc/bloc.dart';
import 'package:imata/repo/auth_repo.dart';
// import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepositry _authRepositry;
  RegisterCubit({required AuthRepositry authRepositry}) :_authRepositry = authRepositry,
        super(RegisterState.initial());

  void emailChanged(String value){
    emit(state.copyWith(email: value , status: RegisterStatus.initial));
  }
  void passwordChanged(String value){
    emit(state.copyWith(password: value , status: RegisterStatus.initial));
  }
  void registerWithCredentials() async {
    if(!state.isValid) return;
    try{
      await _authRepositry.SignUp(email: state.email, password: state.password);
      emit(state.copyWith(status: RegisterStatus.success));
    }catch(_){}
  }
}
