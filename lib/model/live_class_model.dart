//     final LiveCoursePaymentModel = LiveCoursePaymentModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../pdf_section/payment_sucessfull.dart';

LiveCoursePaymentModel LiveCoursePaymentModelFromJson(String str) =>
    LiveCoursePaymentModel.fromJson(json.decode(str));

String LiveCoursePaymentModelToJson(LiveCoursePaymentModel data) =>
    json.encode(data.toJson());

class LiveCoursePaymentModel {
  LiveCoursePaymentModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.courseName,
    required this.courseTime,
    required this.totalPrice,
    required this.roomID,
    required this.id,
    required this.inVoiceNumber,
    required this.time,
    required this.date,
  });

  String useremail;
  String userName;
  String courseid;
  String uid;
  String courseName;
  String courseTime;
  String totalPrice;
  String roomID;
  int inVoiceNumber;
  String time;
  String date;
  String id;
  factory LiveCoursePaymentModel.fromJson(Map<String, dynamic> json) =>
      LiveCoursePaymentModel(
        useremail: json["useremail"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
        courseTime: json["courseTime"] ?? '',
        totalPrice: json["courseTime"] ?? '',
        roomID: json["roomID"] ?? '',
        id: json["id"] ?? '',
        inVoiceNumber: json["inVoiceNumber"] ?? 0,
        time: json["time"] ?? '',
        date: json["date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "courseName": courseName,
        "courseTime": courseTime,
        "totalPrice": totalPrice,
        "roomID": roomID,
        "id": id,
        "inVoiceNumber": inVoiceNumber,
        "time": time,
        "date": date,
      };
}

class LivePaymentStatusAddToFireBase {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future livePaymentModelController(LiveCoursePaymentModel productModel) async {
    var x = await FirebaseFirestore.instance
        .collection("LiveCoursePaymentModel_live")
        .doc(currentUser)
        .get();
    var y = x.data();
    if (y == null) {
      ListofLiveCourses list = ListofLiveCourses(listofLiveCourses: []);
      list.listofLiveCourses.add(productModel);
      try {
        final firebase = FirebaseFirestore.instance;
        final doc = firebase
            .collection("LiveCoursePaymentModel_live")
            .doc(currentUser)
            .set(list.toMap())
            .then((value) => Get.to(Get.to(PaymentSucessfullScreen(
                  inVoiceNumber: 0,
                  customerName: productModel.userName,
                  email: productModel.useremail,
                  purchasingModel: productModel.courseName,
                  price: productModel.totalPrice,
                ))));
      } on FirebaseException catch (e) {
        // log('Error ${e.message.toString()}');
      }
    } 
    
    
    else {
      var z = ListofLiveCourses.fromMap(y);
      ListofLiveCourses list =
          ListofLiveCourses(listofLiveCourses: z.listofLiveCourses);
      list.listofLiveCourses.add(productModel);

      try {
        final firebase = FirebaseFirestore.instance;
        final doc = firebase
            .collection("LiveCoursePaymentModel_live")
            .doc(currentUser)
            .set(list.toMap())
            .then((value) => Get.to(Get.to(PaymentSucessfullScreen(
                  inVoiceNumber: 0,
                  customerName: productModel.userName,
                  email: productModel.useremail,
                  purchasingModel: productModel.courseName,
                  price: productModel.totalPrice,
                ))));
      } on FirebaseException catch (e) {
        // log('Error ${e.message.toString()}');
      }
    }
  }
}

class ListofLiveCourses {
  List<LiveCoursePaymentModel> listofLiveCourses;
  ListofLiveCourses({
    required this.listofLiveCourses,
  });

  ListofLiveCourses copyWith({
    List<LiveCoursePaymentModel>? listofLiveCourses,
  }) {
    return ListofLiveCourses(
      listofLiveCourses: listofLiveCourses ?? this.listofLiveCourses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listofLiveCourses': listofLiveCourses.map((x) => x.toJson()).toList(),
    };
  }

  factory ListofLiveCourses.fromMap(Map<String, dynamic> map) {
    return ListofLiveCourses(
      listofLiveCourses: List<LiveCoursePaymentModel>.from(
        (map['listofLiveCourses'] as List<dynamic>).map<LiveCoursePaymentModel>(
          (x) => LiveCoursePaymentModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListofLiveCourses.fromJson(String source) =>
      ListofLiveCourses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ListofLiveCourses(listofLiveCourses: $listofLiveCourses)';

  @override
  bool operator ==(covariant ListofLiveCourses other) {
    if (identical(this, other)) return true;

    return listEquals(other.listofLiveCourses, listofLiveCourses);
  }

  @override
  int get hashCode => listofLiveCourses.hashCode;
}
