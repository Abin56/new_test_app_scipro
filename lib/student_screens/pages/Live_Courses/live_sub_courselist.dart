// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/live_class_model.dart';
import '../../../screens/hybrid_courses.dart';
import '../../../widgets/button_Container.dart';
import '../../Student_waiting_room.dart';
import '../Record_Courses/recorded_courses.dart';
import '../faculties.dart';
import '../live_Mock_test.dart';
import '../study_materials_screen.dart';
import 'live_Courses_list.dart';

class LiveCourseListScreen extends StatefulWidget {
  String courseID = '';

  LiveCourseListScreen({super.key});

  @override
  State<LiveCourseListScreen> createState() => _LiveCourseListScreenState();
}

class _LiveCourseListScreenState extends State<LiveCourseListScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Courses'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: getLivedocumentList(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshots.data!.data() != null) {
                  ListofLiveCourses listData =
                      ListofLiveCourses.fromMap(snapshots.data!.data()!);

                  if (listData.listofLiveCourses.isEmpty) {
                    return const Center(child: Text("No Courses found"));
                  }
                  return ListView.separated(
                    itemCount: listData.listofLiveCourses.length,
                    itemBuilder: (context, index) {
                      LiveCoursePaymentModel data =
                          listData.listofLiveCourses[index];

                      DateTime exdate = DateTime.parse(data.date);
                      final DateFormat formatter = DateFormat('dd-MM-yyyy');
                      final String formatted = formatter.format(exdate);

                      if (snapshots.hasData) {
                        snapshots.data!.data();

                        return GestureDetector(
                          onTap: () {
                            Get.to(StudentWaitingRoom(
                                id: data.id,
                                roomID: data.roomID,
                                courseName: data.courseName,
                                time: data.courseTime));
                          },
                          child: ButtonContainerWidget(
                            curving: 30,
                            colorindex: 0,
                            height: 100.h,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data.courseName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Exipry date : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        formatted,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              },
            )),
      ),
    );
  }
}

List screens = [
  RecordedCoursesListScreen(),
  LiveCoursesListScreen(),
  HybridCourses(),
  const FacultieScreen(),
  const StudyMaterialsScreen(),
  const LiveMockTestsScreen()
];
Stream<DocumentSnapshot<Map<String, dynamic>>>? getLivedocumentList() {
  final user = FirebaseAuth.instance.currentUser!.uid;
  try {
    var productList = FirebaseFirestore.instance
        .collection('LiveCoursePaymentModel_live')
        .doc(user)
        .snapshots();

    return productList;
  } on FirebaseException catch (_) {
    Future.error('Something went Wrong please try again');
    return null;
  }
}
