
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {

  final String id;
  final String photoPath;
  final String description;
  final String location;

  ReportModel({
  required this.id,
  required this.photoPath,
  required this.description,
  required this.location
  });

  toJson (){

    return {
      'id':id,
      'photoPath':photoPath,
      'description':description,
      'location':location
    };
  }

  factory ReportModel.fromSnapshot(DocumentSnapshot snap){
    final data = snap.data();
    return ReportModel(
      id: snap['id'],
      photoPath: snap['photoPath'],
      description: snap['description'],
      location: snap['location'],
    );

  }




}