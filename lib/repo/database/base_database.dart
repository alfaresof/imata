import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imata/model/user/user.dart';
import 'package:imata/repo/database/base_database_repositry.dart';

class DatabaseRepositry extends BaseDatabaseRepositry {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Stream<UserModel>> getName({required String id}) async {
    return db.collection('users').doc('$id').snapshots().map((event) => UserModel.fromSnapshot(event));
  }

  @override
  Future<String> sendName({required String id, required String name}) async{
    await db.collection('users').doc(id).set(
       {
         'name':name,
         'id':id,
         'reports':[],
       }
     );
    return 'sucess';
  }


  @override
  Future<User?> setPhotoPath(
      {required String id, required String idReport, required String path}) {
    // TODO: implement setPhotoPath
    throw UnimplementedError();
  }
  @override
  Future<String> newReport({required String id, required String description, required String path, required String location}) async {
    await db.collection('reports').doc().set(
        {
          'id':id,
          'desctiption':description,
          'location':location,
          'photoPath':path,
        }
    );
    return 'sucess';
  }
  @override
  Future<QuerySnapshot<Map<String,dynamic>>> getReports({required String id}) async{
    return await db.collection('reports').where('id',isEqualTo: id).get();
  }

 
}
