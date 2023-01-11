import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class RecordedCourseListScreen extends StatelessWidget {
  RecordedCourseListScreen({super.key});

  var todayDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                  return const Center(child: Text("No Courses found"));
                }
                return ListView.separated(
                  itemCount: listData.listofCourse.length,
                  itemBuilder: (context, index) {
                    log(todayDate.toString());
                    UserPaymentModel data = listData.listofCourse[index];
                    DateTime exdate = DateTime.parse(data.exDate);
                    final DateFormat formatter = DateFormat('dd-MM-yyyy');
                    final String formatted = formatter.format(exdate);

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
                return const Center(child: Text('No data found'));
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
