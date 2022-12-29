
// ignore_for_file: unnecessary_new, prefer_collection_literals

class VideoModel{
  late String   name,thumbnail,mediaurl;

  VideoModel({required this.name, required this.thumbnail, required this.mediaurl});

  VideoModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    thumbnail = json['thumbnail'];
    mediaurl = json['mediaurl'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['mediaurl'] = mediaurl;
    return data;

  }
}