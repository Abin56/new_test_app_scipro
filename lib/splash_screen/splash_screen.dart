import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scipro_application/model/live_class_model.dart';
import 'package:scipro_application/model/payment_model.dart';
import '../signin/student_faculty_login_screen.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> checkExDate() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingRec = await FirebaseFirestore.instance
        .collection('UserRECPaymentModel')
        .doc(user)
        .get();

    ListofCourses checkingRecDate = ListofCourses.fromMap(checkingRec.data()!);
    // var courseList = checkingRecDate.listofCourse;
    checkingRecDate.listofCourse.removeWhere((element) {
      return DateTime.parse(element.exDate).isBefore(DateTime.now());
    });

    await FirebaseFirestore.instance
        .collection("UserRECPaymentModel")
        .doc(user)
        .set(checkingRecDate.toMap());
    return;
  }

  Future<void> checkLiveExDate() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingRec = await FirebaseFirestore.instance
        .collection('LiveCoursePaymentModel_live')
        .doc(user)
        .get();

    ListofLiveCourses checkingRecDate =
        ListofLiveCourses.fromMap(checkingRec.data()!);
    // var courseList = checkingRecDate.listofCourse;
    checkingRecDate.listofLiveCourses.removeWhere((element) {
      return DateTime.parse(element.date).isBefore(DateTime.now());
    });

    await FirebaseFirestore.instance
        .collection("LiveCoursePaymentModel_live")
        .doc(user)
        .set(checkingRecDate.toMap());
    return;
  }

  @override
  void initState() {
    log("haiiiiii");

    // checkExDateLive();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    checkExDate();
    checkLiveExDate();
    goHomeScreen(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // goHomeScreen(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/SCIPRO.png"),
      ),
    );
  }
}

goHomeScreen(context) async {
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => const StudentandFacultyLoginScreen()));
}
