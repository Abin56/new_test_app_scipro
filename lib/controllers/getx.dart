import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/hive/profile_model.dart';
import '../model/video_model.dart';

class SciProController extends GetxController {
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];
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

  Stream<List<VideoFectingModel>> getProduct(String type) {
    log(">>>>>>>>iddddddddddddddddddddddddd${type}");
    String catData = '';
    for (Map<String, dynamic> map in categoryCollections) {
      if (map["courseTitle"] == type) {
        catData = map["id"];
      }
    }
    final data = FirebaseFirestore.instance
        .collection("RecordedCourse_videos")
        .where('course', isEqualTo: catData)
        .snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => VideoFectingModel.fromJson(e.data())).toList());
    log('lepton>>>>>>>>>>>>>>>...${d.toString()}');

    return d;
  }

  Future<List<Map<String, dynamic>>> fetchingCategory() async {
    List<Map<String, dynamic>> list = [];
    await FirebaseFirestore.instance
        .collection("RecordedCourselist")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    list1 = list;
    log(list.toString());

    categoryCollections = list;
    log(list.toString(), name: "calling");
    update();
    return list;
  }

  @override
  void onInit() {
    fetchingCategory();
    super.onInit();
  }
}
