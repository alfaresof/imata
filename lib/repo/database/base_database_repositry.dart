import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:imata/model/user/user.dart';

abstract class BaseDatabaseRepositry {
  Future<String> sendName({required String id, required String name});
  Future<String> newReport({
    required String id,
    required String description,
    required String path,
    required String location
  });
  Future<QuerySnapshot<Map<String,dynamic>>> getReports({
    required String id,
  });
  Future<Stream<UserModel>> getName({
    required String id,
  });
  Future<void> setPhotoPath(
      {required String id, required String idReport, required String path});
}
