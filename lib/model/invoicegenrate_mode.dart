//     final InvoiceNumberGenrateModel = InvoiceNumberGenrateModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pdf_section/payment_sucessfull.dart';

InvoiceNumberGenrateModel InvoiceNumberGenrateModelFromJson(String str) =>
    InvoiceNumberGenrateModel.fromJson(json.decode(str));

String InvoiceNumberGenrateModelToJson(InvoiceNumberGenrateModel data) =>
    json.encode(data.toJson());

class InvoiceNumberGenrateModel {
  InvoiceNumberGenrateModel({
    required this.number,
  });

  int number;

  factory InvoiceNumberGenrateModel.fromJson(Map<String, dynamic> json) =>
      InvoiceNumberGenrateModel(
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
      };
}

class InvoiceNumberAddToFireBase {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future invoiceNumberModelController(
      InvoiceNumberGenrateModel number,) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("InvoiceNumber")
          .doc('integer')
          .set(number.toJson());
    } on FirebaseException catch (e) {
      // log('Error ${e.message.toString()}');
    }
  }
}
