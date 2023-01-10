//     final ExDateModel = ExDateModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pdf_section/payment_sucessfull.dart';

ExDateModel ExDateModelFromJson(String str) =>
    ExDateModel.fromJson(json.decode(str));

String ExDateModelToJson(ExDateModel data) =>
    json.encode(data.toJson());

class ExDateModel {
  ExDateModel({
    required this.exdate,

  });

  String exdate;

  factory ExDateModel.fromJson(Map<String, dynamic> json) =>
      ExDateModel(
        exdate: json["exdate"] ?? '',
 
      );

  Map<String, dynamic> toJson() => {
        "exdate": exdate,

      };
}


