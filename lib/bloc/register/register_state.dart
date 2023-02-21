part of 'register_cubit.dart';
// import 'package:equatable/equatable.dart';

enum RegisterStatus {initial , submitting, success , error }
// extends Equatable
 class RegisterState  {
  final String email;
  final String password;
  final RegisterStatus status;
  const RegisterState( {
    required this.email,
    required this.password,
    required this.status,
  });
  factory RegisterState.initial(){
    return RegisterState(email: '', password: '', status: RegisterStatus.initial);
  }


  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
    }){
    return RegisterState(
        email: email ?? this.email,
        password: password??this.password,
        status: status??this.status
    );
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object> get props => [email , password , status];
}
