// ignore_for_file: public_member_api_docs, sort_constructors_first
//     final StudyMaterialModel = StudyMaterialModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

StudyMaterialModel StudyMaterialModelFromJson(String str) =>
    StudyMaterialModel.fromJson(json.decode(str));

String StudyMaterialModelToJson(StudyMaterialModel data) =>
    json.encode(data.toJson());

class StudyMaterialModel {
  StudyMaterialModel({
    required this.id,
    required this.studymaterialFile,
    required this.subtitle,
    required this.category,
    required this.subject,
    required this.courseTitle,
  });

  String id;

  String studymaterialFile;

  String subtitle;
  String category;
  String subject;
  String courseTitle;

  factory StudyMaterialModel.fromJson(Map<String, dynamic> json) =>
      StudyMaterialModel(
        id: json["id"] ?? '',
        studymaterialFile: json["vcourseame"] ?? '',
        subtitle: json["subtitle"] ?? "",
        category: json["category"] ?? "",
        subject: json["subject"] ?? "",
        courseTitle: json["courseTitle"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studymaterialFile": studymaterialFile,
        "subtitle": subtitle,
        "category": category,
        "subject": subject,
        "courseTitle": courseTitle,
      };
}

class AfterPaymentStudyMaterialToFireBase {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future afterPaymentstudyMaterialController(
      StudyMaterialModel studymaterialModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("StudyMaterials_payedStudents").doc(uid);
      studymaterialModel;

      doc.set(studymaterialModel.toJson());

      // then((value) {
      //   // isWorking = false;
      //   return showDialog(
      //     context: context,
      //     barrierDismissible: false, // user must tap button!
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: const Text('Message'),
      //         content: SingleChildScrollView(
      //           child: ListBody(
      //             children: const <Widget>[
      //               Text('Successfully Uploaded to Server'),
      //             ],
      //           ),
      //         ),
      //         actions: <Widget>[
      //           TextButton(
      //             child: const Text('ok'),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // });
      // .then((value) => Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return FacultyScreen(id: doc.id);
      //       },
      //     )));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}

class ListSmaterial {
  List<StudyMaterialModel> listofStudyMaterials;
  ListSmaterial({
    required this.listofStudyMaterials,
  });

  ListSmaterial copyWith({
    List<StudyMaterialModel>? listofStudyMaterials,
  }) {
    return ListSmaterial(
      listofStudyMaterials: listofStudyMaterials ?? this.listofStudyMaterials,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listofStudyMaterials':
          listofStudyMaterials.map((x) => x.toJson()).toList(),
    };
  }

  factory ListSmaterial.fromMap(Map<String, dynamic> map) {
    return ListSmaterial(
      listofStudyMaterials: List<StudyMaterialModel>.from(
        (map['listofStudyMaterials'] as List<int>).map<StudyMaterialModel>(
          (x) => StudyMaterialModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListSmaterial.fromJson(String source) =>
      ListSmaterial.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ListSmaterial(listofStudyMaterials: $listofStudyMaterials)';

  @override
  bool operator ==(covariant ListSmaterial other) {
    if (identical(this, other)) return true;

    return listEquals(other.listofStudyMaterials, listofStudyMaterials);
  }

  @override
  int get hashCode => listofStudyMaterials.hashCode;
}
