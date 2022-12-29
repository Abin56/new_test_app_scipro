//     final UserPaymentModel = UserPaymentModelFromJson(jsonString);
// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable, camel_case_types
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pdf_section/payment_sucessfull.dart';

UserPaymentModel UserPaymentModelFromJson(String str) =>
    UserPaymentModel.fromJson(json.decode(str));

String UserPaymentModelToJson(UserPaymentModel data) =>
    json.encode(data.toJson());

class UserPaymentModel {
  UserPaymentModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.courseName,
    required this.totalprice,
    required this.randomNumber,
  });
  String userName;

  String useremail;
  String courseid;
  String uid;
  String courseName;
  String totalprice;
  String randomNumber;

  factory UserPaymentModel.fromJson(Map<String, dynamic> json) =>
      UserPaymentModel(
        useremail: json["useremail"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
        totalprice: json["totalprice"],
        randomNumber: json["randomNumber"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "courseName": courseName,
        "totalprice": totalprice,
        "randomNumber": randomNumber,
      };
}

class UserAddressAddToFireBase {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future addUserPaymentModelController(
    UserPaymentModel productModel,
  ) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("UserPaymentModel")
          .doc(currentUser)
          .set(productModel.toJson())
          .then((value) => Get.to(PaymentSucessfullScreen(
                customerName: productModel.userName,
                email: productModel.useremail,
                purchasingModel: productModel.courseName,
                price: productModel.totalprice,
              )
              ));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}

class order {
  int index = 1;
  String userName;
  String userCourseName;
  String userEmail;
  String totalprice;

  order(
      {required this.userName,
      required this.userCourseName,
      required this.userEmail,
      required this.totalprice});
}
