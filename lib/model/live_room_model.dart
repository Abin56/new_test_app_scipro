//     final LiveRoomModel = LiveRoomModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pdf_section/payment_sucessfull.dart';

LiveRoomModel LiveRoomModelFromJson(String str) =>
    LiveRoomModel.fromJson(json.decode(str));

String LiveRoomModelToJson(LiveRoomModel data) => json.encode(data.toJson());

class LiveRoomModel {
  LiveRoomModel(
      {required this.courseTitle,
      required this.userName,
      required this.courseID,
      required this.uid,
required this.id,
      required this.facultyName,
      required this.message,
      required this.password,
      required this.roomID,
      required this.onpress});

  String courseTitle;
  String userName;
  String courseID;
  String uid;
  String facultyName;
  String message;
  String password;
  String roomID;
    String id;
  bool onpress = false;
  factory LiveRoomModel.fromJson(Map<String, dynamic> json) => LiveRoomModel(
        courseTitle: json["courseTitle"] ?? '',
        userName: json["userName"] ?? '',
        courseID: json["courseID"] ?? '',
        uid: json["uid"] ?? '',
        facultyName: json["facultyName"] ?? '',
        message: json["message"] ?? '',
        password: json["password"] ?? '',
        roomID: json["roomID"] ?? '',
        onpress: json["onpress"] ?? false,
          id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "courseTitle": courseTitle,
        "userName": userName,
        "courseID": courseID,
        "uid": uid,
        "facultyName": facultyName,
        "message": message,
        "password": password,
        "roomID": roomID,
        "onpress": onpress,
          "id": id,
      };
}

// class LivePaymentStatusAddToFireBase {
//   final currentUser = FirebaseAuth.instance.currentUser!.uid;
//   Future livePaymentModelController(
//       LiveRoomModel productModel, String randomNumner) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase
//           .collection("LiveRoomModel_live")
//           .doc(currentUser)
//           .set(productModel.toJson())
//           .then((value) => Get.to(Get.to(PaymentSucessfullScreen(
//                 customerName: productModel.userName,
//                 email: productModel.courseTitle,
//                 purchasingModel: productModel.facultyName,
//                 price: productModel.password,
//               ))));
//     } on FirebaseException catch (e) {
//       // log('Error ${e.message.toString()}');
//     }
//   }
// }
