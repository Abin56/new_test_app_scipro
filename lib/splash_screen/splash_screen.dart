import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../signin/student_faculty_login_screen.dart';

class Splashscreen extends StatefulWidget {
  var todayDate = DateTime.now();
  var todayDatee = DateTime.now();

  var exDate = '';
  var exDatee = '';
// final examplecontoler = Get.find<StateGetx>()
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void checkExDate() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingLive = await FirebaseFirestore.instance
        .collection('UserRECPaymentModel')
        .doc(user)
        .get();

    setState(() {
      checkingLive.data()!['exDate'];
      widget.exDate = checkingLive.data()!['exDate'];
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.exDatee}');
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.todayDate}');

      var checking = DateTime.parse(widget.exDatee);
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

  void checkExDateLive() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingLive = await FirebaseFirestore.instance
        .collection('LiveCoursePaymentModel_live')
        .doc(user)
        .get();

    setState(() {
      checkingLive.data()!['date'];
      widget.exDatee = checkingLive.data()!['date'];
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.exDatee}');
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.todayDatee}');

      var checking = DateTime.parse(widget.exDatee);
      var answerdate = checking.difference(widget.todayDatee).inMinutes;
      log('Date Anser >>>>>>>>>>>>>>>>>>>..${answerdate}');

      if (answerdate < 0) {
        FirebaseFirestore.instance
            .collection("LiveCoursePaymentModel_live")
            .doc(user)
            .delete();
        log("Expired>>>>>>>>>>>>>>>>>>>>>");
      } else {
        log("Not expried>>>>>>>>>");
      }
    });
  }

  @override
  void initState() {
    log("haiiiiii");
    checkExDate();
    checkExDateLive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    goHomeScreen(context);
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
