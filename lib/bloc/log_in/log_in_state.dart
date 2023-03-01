part of 'log_in_cubit.dart';
// import 'package:equatable/equatable.dart';

enum LogInStatus { auth, initial, unauth, success, error }

// extends Equatable
class LogInState {
  final String email;
  final String password;
  final String id;
  final LogInStatus status;
  const LogInState({
    required this.id,
    required this.email,
    required this.password,
    required this.status,
  });
  factory LogInState.initial() {
    return LogInState(id: '',email: '', password: '', status: LogInStatus.initial);
  }

  LogInState copyWith({
    String? email,
    String? password,
    String? name,
    String? id,
    LogInStatus? status,
  }) {
    return LogInState(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object> get props => [email, password, status];
}
