// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:scipro_application/video_player/video_screen.dart';
import '../model_classes/v_model.dart';

class RecordedvideosPlayList extends StatefulWidget {
  String videoPath;

  late DatabaseReference videoRef;
  RecordedvideosPlayList({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<RecordedvideosPlayList> createState() => _RecordedvideosPlayListState();
}

class _RecordedvideosPlayListState extends State<RecordedvideosPlayList> {
  @override
  void initState() {
    super.initState();
    final database = FirebaseDatabase.instance;
    widget.videoRef = database.ref().child(widget.videoPath);
  }

  @override
  Widget build(BuildContext context) {
    log('Videopath>>>>>>>>>>>>>>>>>>>>>>>${widget.videoPath}');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recorded courses",
          style: TextStyle(fontSize: 15, color: Colors.red),
        ),
      ),
      body: FirebaseAnimatedList(
          query: widget.videoRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            VideoModel videoModel =
                VideoModel.fromJson(json.decode(json.encode(snapshot.value)));
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoScreen(
                            name: videoModel.name,
                            mediaUrl: videoModel.mediaurl)));
              },
              child: Image.network(videoModel.thumbnail),
            );
          }),
    );
  }
}
