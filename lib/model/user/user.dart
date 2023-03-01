import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final List<Map<String, String>> reports;
  final List<Map<String, String>> photos;

  UserModel(
      {required this.name,
      required this.id,
      required this.reports,
      required this.photos});

  @override
  List<Object?> get props => [id, name, reports, photos];

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    UserModel user = UserModel(
        name: snapshot['name'],
        id: snapshot['id'],
        reports: snapshot['reports'],
        photos: snapshot['photos']);
    return user;
  }

}
