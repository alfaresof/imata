
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:imata/repo/base_auth_repositry.dart';

class AuthRepositry extends BaseAuthRepositry{
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepositry({auth.FirebaseAuth? firebaseAuth}):
  _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> SignUp({required String email, required String password}) async{
    try{
      print(email);
      // print(password);
      final creditinal = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = creditinal.user;
      return user;
    }catch(e){
      print(e);
    }
    throw UnimplementedError();
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();


}