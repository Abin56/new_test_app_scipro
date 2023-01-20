//     final RecGetInvoiceModel = RecGetInvoiceModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

RecGetInvoiceModel RecGetInvoiceModelFromJson(String str) =>
    RecGetInvoiceModel.fromJson(json.decode(str));

String RecGetInvoiceModelToJson(RecGetInvoiceModel data) =>
    json.encode(data.toJson());

class RecGetInvoiceModel {
  RecGetInvoiceModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.courseName,
    required this.inVoiceNumber,
    required this.date,
    required this.time,
    required this.totalprice,
    required this.id,
  });

  String userName;
  String courseid;
  String useremail;
  String uid;
  String id;
  String courseName;
  dynamic inVoiceNumber;
  String date;
  String time;
  dynamic totalprice;

  factory RecGetInvoiceModel.fromJson(Map<String, dynamic> json) =>
      RecGetInvoiceModel(
        useremail: json["useremail"] ?? '',
        inVoiceNumber: json["inVoiceNumber"] ?? '',
        date: json["date"] ?? '',
        time: json["time"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
        totalprice: json["totalprice"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "inVoiceNumber": inVoiceNumber,
        "courseName": courseName,
        "date": date,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "time": time,
        "totalprice": totalprice,
        "id": id,
      };
}

class RecGetInvoiceAddToFireBase {
  Future recGetInvoiceController(RecGetInvoiceModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("Rec_Invoice_Collection").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson());
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
