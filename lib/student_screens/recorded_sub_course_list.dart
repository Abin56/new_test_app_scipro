import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/model/video_model.dart';
import 'package:scipro_application/student_screens/pages/Live_Courses/live_Courses_list.dart';
import 'package:scipro_application/student_screens/pages/Record_Courses/recorded_courses.dart';
import 'package:scipro_application/student_screens/pages/faculties.dart';
import 'package:scipro_application/student_screens/pages/live_Mock_test.dart';
import 'package:scipro_application/student_screens/pages/study_materials_screen.dart';

import '../model/payment_model.dart';
import '../screens/hybrid_courses.dart';
import '../video_player/videoplayer_firebase.dart';
import '../widgets/button_Container.dart';

class RecordedCourseListScreen extends StatefulWidget {
  var todayDate = DateTime.now();
  var exDate = '';
  String courseID = '';

  RecordedCourseListScreen({super.key});

  @override
  State<RecordedCourseListScreen> createState() =>
      _RecordedCourseListScreenState();
}

class _RecordedCourseListScreenState extends State<RecordedCourseListScreen> {
  @override
  void initState() {
    checkExDate();
    super.initState();
  }

  void checkExDate() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingLive = await FirebaseFirestore.instance
        .collection('UserRECPaymentModel')
        .doc(user)
        .get();

    setState(() {
      checkingLive.data()!['exDate'];
      widget.exDate = checkingLive.data()!['exDate'];
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.exDate}');
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.todayDate}');

      var checking = DateTime.parse(widget.exDate);
      var answerdate = checking.difference(widget.todayDate).inMinutes;
      log('Date Anser >>>>>>>>>>>>>>>>>>>..${answerdate}');

      if (answerdate < 0) {
        FirebaseFirestore.instance
            .collection("UserRECPaymentModel")
            .doc(user)
            .delete();
        log("Expired>>>>>>>>>>>>>>>>>>>>>");
      } else {
        log("Not expried>>>>>>>>>");
      }
    });
  }

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
            stream: getdocumentList(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshots.data!.data() != null) {
                ListofCourses listData =
                    ListofCourses.fromMap(snapshots.data!.data()!);

                if (listData.listofCourse.isEmpty) {
                  return const Text("No data");
                }
                return ListView.separated(
                  itemCount: listData.listofCourse.length,
                  itemBuilder: (context, index) {
                    UserPaymentModel data = listData.listofCourse[index];

                    if (snapshots.hasData) {
                      snapshots.data!.data();

                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              RecordedvideosPlayList(catData: data.courseName));
                        },
                        child: ButtonContainerWidget(
                          curving: 30,
                          colorindex: 0,
                          height: 100.h,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  data.courseName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                              Text(
                                data.courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
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
                return Text('');
              }
            },
          ),
        ),
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
Stream<DocumentSnapshot<Map<String, dynamic>>>? getdocumentList() {
  final user = FirebaseAuth.instance.currentUser!.uid;
  try {
    var productList = FirebaseFirestore.instance
        .collection('UserRECPaymentModel')
        .doc(user)
        .snapshots();

    return productList;
  } on FirebaseException catch (_) {
    Future.error('Something went Wrong please try again');
    return null;
  }
}
