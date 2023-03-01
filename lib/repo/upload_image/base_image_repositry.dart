import 'package:image_picker/image_picker.dart';

abstract class BaseImageRepositry {
  Future<void> uploadImage(String id, XFile image);
}
