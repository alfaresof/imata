import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepositry {

  Stream<auth.User?> get user;
  Future<auth.User?> SignUp({
  required String email,
  required String password
});
}