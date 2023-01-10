//     final VideoFectingModel = VideoFectingModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

VideoFectingModel VideoFectingModelFromJson(String str) =>
    VideoFectingModel.fromJson(json.decode(str));

String VideoFectingModelToJson(VideoFectingModel data) =>
    json.encode(data.toJson());

class VideoFectingModel {
  VideoFectingModel({
    required this.id,
    required this.videoImage,
    required this.videoName,
    required this.videoPath,
    required this.course,
  
  });

  String id;
  String videoImage;
  String videoName;
  String videoPath;
  String course;
 

  factory VideoFectingModel.fromJson(Map<String, dynamic> json) =>
      VideoFectingModel(
        id: json["id"] ?? '',
        videoImage: json["videoImage"] ?? '',
        videoName: json["videoName"] ?? '',
        videoPath: json["videoPath"] ?? "",
        course: json["course"] ?? "",
   
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "videoImage": videoImage,
        "videoName": videoName,
        "videoPath": videoPath,
        "course": course,
    
      };
}
