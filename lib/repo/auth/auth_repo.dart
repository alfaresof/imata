import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:imata/repo/auth/base_auth_repositry.dart';
import 'package:imata/repo/database/base_database.dart';

class AuthRepositry extends BaseAuthRepositry {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepositry({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> SignUp(
      {required String name,required String email, required String password}) async {
    try {
      print(email);
      // print(password);
      final creditinal = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = creditinal.user;
      await DatabaseRepositry().sendName(id:user!.uid.toString() , name: name);
      print(name);
      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<auth.User?> LogIn({required String email, required String password}) async{
    try {
      print(email);
      // print(password);
      final creditinal = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = creditinal.user;

      return user;
    } catch (e) {
      print(e);
    }
  }
}
