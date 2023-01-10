// ignore_for_file: must_be_immutable, unused_field, sort_child_properties_last, unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/main_scroll_screens/current_course_slider.dart';
import 'package:scipro_application/main_scroll_screens/current_courses_mainpage.dart';
import 'package:scipro_application/screens/listof_subscribe.dart';

import '../main_scroll_screens/our_popular_courses.dart';
import '../methods/auth_methods.dart';
import '../utils/app_colors.dart';
import '../utils/explore_drawer.dart';
import '../widgets/custom_button.dart';

class MyHomePage extends StatefulWidget {
  var courseID = '';
  var liveCourseID = '';
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthMethods _authMethods = AuthMethods();
  //late TextEditingController nameController;
  late String nameController;

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  final List<String> imagesList = [
    'assets/divya.png',
    'assets/gokul.png',
    'assets/praveena.png',
    'assets/rekha.png',
    'assets/sunil.png',
  ];
  final List<String> titles = [
    'Dr. Divya P.S',
    'Gokul S',
    'Praveena T.P',
    'Dr. Rekha Mol K.R',
    'Sunil P'
  ];
  final List<String> subtitles = [
    'Microbiologist',
    'Technologist',
    'Physicist',
    'Biotechnologist',
    'IT Security Consultant',
  ];
  final List<String> courseImagesList = [
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/15.jpg',
  ];

  List<Widget> generateImagesTiles() {
    return imagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  List<Widget> generateCoursesImagesTiles() {
    return courseImagesList
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  _scrollListner() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void checkUserPayment() async {
    log('Callling the UserPAmentModel');
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checking = await FirebaseFirestore.instance
        .collection('UserRECPaymentModel')
        .doc(user)
        .get();
    log('Data loading >>>>>>>>>>>>>>>>>>>..${checking}');
    setState(() {
      widget.courseID = checking.data()!['listofCourse'];
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.courseID}');
    });
  }

  void checkLivePayment() async {
    log('Callling the LiveCoursePaymentModel_live');
    final user = FirebaseAuth.instance.currentUser!.uid;
    var checkingLive = await FirebaseFirestore.instance
        .collection('LiveCoursePaymentModel_live')
        .doc(user)
        .get();
    log('Data loading >>>>>>>>>>>>>>>>>>>..${checkingLive}');
    setState(() {
      widget.liveCourseID = checkingLive.data()!['courseName'];
      log('Data loading >>>>>>>>>>>>>>>>>>>..${widget.liveCourseID}');
    });
  }

  @override
  void initState() {
    checkLivePayment();
    checkUserPayment();
    _scrollController.addListener(_scrollListner);
    nameController = _authMethods.user.displayName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    log(user.toString());
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      drawer: const ExploreDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    gradient: LinearGradient(
                      colors: [
                        AppColor.gradientFirst.withOpacity(0.9),
                        AppColor.gradientSecond
                      ],
                      begin: const FractionalOffset(0.0, 0.4),
                      end: Alignment.topRight,
                    )),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/SCIPRO.png",
                            width: 100,
                            height: 120,
                          ),
                          const Text(
                            "The Science Professional",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            "Hi ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            nameController,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "!",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                        text: 'Subscribed Courses',
                        onPressed: () async {
                          Get.to(const UserSelectingCourselisting());
                        })
                    // Builder(builder: (context) {
                    //   if (widget.courseID.isNotEmpty) {
                    //     return CustomButton(
                    //         text: 'Subscribed Courses',
                    //         onPressed: () async {
                    //           Get.to(const UserSelectingCourselisting());
                    //         });
                    //   } else if (widget.liveCourseID.isNotEmpty) {
                    //     return CustomButton(
                    //         text: 'Subscribed Courses',
                    //         onPressed: () async {
                    //           Get.to(const UserSelectingCourselisting());
                    //         });
                    //   } else if (widget.liveCourseID.isNotEmpty &&
                    //       widget.courseID.isNotEmpty) {
                    //     return CustomButton(
                    //         text: 'Subscribed Courses',
                    //         onPressed: () async {
                    //           Get.to(const UserSelectingCourselisting());
                    //         });
                    //   } else if (widget.liveCourseID.isEmpty &&
                    //       widget.courseID.isEmpty) {
                    //     return const SizedBox(
                    //       height: 50,
                    //     );
                    //   } else {
                    //     return const SizedBox(
                    //       height: 50,
                    //     );
                    //   }
                    // }),
                  ],
                ),
              ),
            ]),
            const CurrentCourseSlider(),
            SizedBox(
              height: 50.h,
            ),
            const OurPopularCourses(),
            const CurrentCoursesMainPage()
          ],
        ),
      ),
    );
  }
}
