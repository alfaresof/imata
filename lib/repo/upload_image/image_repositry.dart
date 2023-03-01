import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:imata/repo/upload_image/base_image_repositry.dart';

class ImageRepositry extends BaseImageRepositry {
  final firebase_storage.FirebaseStorage stor =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(String id, XFile image) async {
    try {
      await stor.ref('$id/${image.path}').putFile(File(image.path));
    } catch (_) {}
  }
}
