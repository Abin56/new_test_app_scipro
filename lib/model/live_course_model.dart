//     final LiveCourseAddModel = LiveCourseAddModelFromJson(jsonString);

// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:convert';

LiveCourseAddModel LiveCourseAddModelFromJson(String str) =>
    LiveCourseAddModel.fromJson(json.decode(str));

String LiveCourseAddModelToJson(LiveCourseAddModel data) =>
    json.encode(data.toJson());

class LiveCourseAddModel {
  LiveCourseAddModel({
    required this.courseTitle,
    required this.facultyName,
    required this.courseFee,
    required this.id,
    required this.duration,
    required this.courseID,
    required this.postedDate,
    required this.postedTime,
    required this.roomID,
  });

  String facultyName;
  String courseFee;
  String courseTitle;
  String id;
  String duration;
  String courseID;
  String postedDate;
  String postedTime;
  String roomID;

  factory LiveCourseAddModel.fromJson(Map<String, dynamic> json) =>
      LiveCourseAddModel(
        courseTitle: json["courseTitle"] ?? '',
        facultyName: json["facultyName"] ?? '',
        courseFee: json["courseFee"] ?? '',
        id: json["id"] ?? '',
        duration: json["duration"] ?? 0,
        courseID: json["courseID"] ?? '',
        postedDate: json["postedDate"] ?? '',
        postedTime: json["postedTime"] ?? '',
        roomID: json["roomID"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "courseTitle": courseTitle,
        "facultyName": facultyName,
        "courseFee": courseFee,
        "id": id,
        "duration": duration,
        "courseID": courseID,
        "postedDate": postedDate,
        "postedTime": postedTime,
        "roomID": roomID,
      };
}

// class LiveCourseAddToFireBase {
//   Future liveCourseController(LiveCourseAddModel productModel, context) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase.collection("LiveCourselist").doc();
//       productModel.id = doc.id;

//       doc.set(productModel.toJson()).then((value) => Navigator.pop(context));
//     } on FirebaseException catch (e) {
//       print('Error ${e.message.toString()}');
//     }
//   }
// }
