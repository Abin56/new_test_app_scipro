import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/faculty_screens/room_id_pass.dart';
import 'package:scipro_application/model/live_room_model.dart';
import 'package:scipro_application/widgets/button_Container.dart';

class FacultyLiveCourseList extends StatelessWidget {
  FacultyLiveCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("LiveCourselist")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final data = LiveRoomModel.fromJson(
                            snapshot.data!.docs[index].data());
                        return GestureDetector(
                          onTap: () {
                            log(data.id);
                            Get.to(RoomIDandPassWord(
                              roomId: data.roomID,
                              id: data.id,
                              onpressed: data.onpress,
                              facultyId: data.courseID,
                              password: data.password,
                            ));
                          },
                          child: ButtonContainerWidget(
                            curving: 20,
                            colorindex: 5,
                            height: 200,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                data.courseTitle,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: snapshot.data!.docs.length);
                } else {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              })),
    );
  }
}
