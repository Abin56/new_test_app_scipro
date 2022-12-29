import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  String courseID = '';

  RecordedCourseListScreen({super.key});

  @override
  State<RecordedCourseListScreen> createState() =>
      _RecordedCourseListScreenState();
}

class _RecordedCourseListScreenState extends State<RecordedCourseListScreen> {
  // String _userCourse = "";
  @override
  // void initState() {
  //   // checkUserCourseList();

  //   super.initState();
  // }

  //
  // void checkUserCourseList() async {
  //   log('Calling>>>>>>>>>>>>>>>>');
  //   final user = FirebaseAuth.instance.currentUser!.uid;
  //   var checking = await FirebaseFirestore.instance
  //       .collection('UserPaymentModel')
  //       .doc(user)
  //       .get();
  //   setState(() {
  //     _userCourse = checking.data()!['courseid'];
  //     log(_userCourse);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribed Courses'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("UserPaymentModel")
                  .snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.separated(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;
                          // log('LoadingData>>>>>>>>>>>>>>>>>>>>>>>>>${data.toString()}');

                          if (user == data['uid']) {
                            // log('UIDDDDDDD>>>>>>>>>>>>>>>>>>>>>>>>>${data['uid'].toString()}');
                            return GestureDetector(
                              onTap: () {
                                final newdata = UserPaymentModel.fromJson(
                                    snapshots.data!.docs[index].data()
                                        as Map<String, dynamic>);
                                log('VIDEOPATH>>>>>>>>>>>>>>>${newdata.courseid.toString()}');
                                Get.to(RecordedvideosPlayList(
                                  videoPath: newdata.courseid,
                                ));
                              },
                              child: ButtonContainerWidget(
                                curving: 30,
                                colorindex: 0,
                                height: 200.h,
                                width: double.infinity,
                                child: Center(
                                    child: Text(
                                  data['courseName'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                )),
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
              },
            )),
      ),
    );
  }
}

List screens = [
  RecordedCoursesListScreen(),
  LiveCoursesListScreen(),
  const HybridCourses(),
  const FacultieScreen(),
  const StudyMaterialsScreen(),
  const LiveMockTestsScreen()
];
