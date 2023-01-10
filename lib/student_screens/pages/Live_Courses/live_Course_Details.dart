// ignore_for_file: file_names, unnecessary_import, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../payment_RazorPay/livecourse_payment.dart';
import '../../../widgets/button_Container.dart';

class LiveCourseDetailScreen extends StatelessWidget {
  String coursetitle;
  String faculty;
  String coursefee;
  String duration;
  String courseId;
  String time;
  String date;
  String id;
  String roomID;
  LiveCourseDetailScreen(
      {required this.coursetitle,
      required this.faculty,
      required this.coursefee,
      required this.duration,
      required this.courseId,
      required this.date,
      required this.time,
      required this.roomID,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 44, 59),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: ButtonContainerWidget(
                    curving: 10,
                    colorindex: 0,
                    height: 40.h,
                    width: 40.w,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Course Details",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            ButtonContainerWidget(
              curving: 30,
              colorindex: 0,
              height: 500.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SciPro Recorded Course Details',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(coursetitle + "    Course Details"),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Course Title :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          coursetitle,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Faculty :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          faculty,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Course Fee :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          coursefee.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Duration :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          duration.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Course ID :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          courseId,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Posted Date :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Posted Time :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                Get.to(LiveCoursePayment(
                    duration: int.parse(duration),
                    id: id,
                    roomID: roomID,
                    courseTime: time,
                    courseName: coursetitle,
                    totalPrice: coursefee,
                    courseID: courseId));
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 5,
                height: 60.h,
                width: 200.w,
                child: Center(
                  child: Text(
                    " 🔔 Subscribe ",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
