import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/hive/profile_model.dart';

class SciProController extends GetxController {
    var list = <DBStudentList>[].obs;
  String? pickedImage;

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);
    // pickedImage = images!.path.obs;
    pickedImage = images!.path;
    log(pickedImage!);
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedImage = images!.path;
    log(pickedImage!);
    update();
  }
}
