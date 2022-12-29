// import 'dart:async';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:scipro/payment_RazorPay/payment_screen.dart';
// import 'package:scipro/widgets/button_Container.dart';

// var arCourseID = "";

// var arec_courseID = "";

// class RecordCourseDetail extends StatefulWidget {
//   final String courseID;

//   RecordCourseDetail({super.key, required this.courseID});

//   @override
//   State<RecordCourseDetail> createState() => _RecordCourseDetailState();
// }

// class _RecordCourseDetailState extends State<RecordCourseDetail> {
//   String name = "";
//   //List<Map<String,dynamic>> data = [

//   String timeText = "";
//   String dateText = "";

//   String formatCurrentLiveTime(DateTime time) {
//     return DateFormat("hh:mm:ss a").format(time);
//   }

//   String formatCurrentDate(DateTime date) {
//     return DateFormat("dd MMMM, yyyy").format(date);
//   }

//   getCurrentLiveTime() {
//     final DateTime timeNow = DateTime.now();
//     final String liveTime = formatCurrentLiveTime(timeNow);
//     final String liveDate = formatCurrentDate(timeNow);

//     if (this.mounted) {
//       setState(() {
//         timeText = liveTime;
//         dateText = liveDate;
//       });
//     }
//   }

//   //final userId = loginUser!.uid.toString();
//   CollectionReference ref = FirebaseFirestore.instance.collection('Admin');

//   String imageUrl = "";
//   String img = "";
//   double progress = 0.0;
//   String listID = "";
//   String _courseTitle = "";
//   String _courseFee = "";
//   String _courseDuration = "";
//   String _courseID = "";
//   String _facultyName = "";
//   String _dater = "";
//   String _timer = "";
//   String _videoNumber = "";

//   creatNewMeeting() async {
//     var random = Random();
//     String roomName = (random.nextInt(10000000) + 10000000).toString();
//     // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
//     listID = roomName;
//   }

//   var courseid = arCourseID;

//   CollectionReference refRecorded =
//       FirebaseFirestore.instance.collection("RecordedCourselist");
//   CollectionReference refLive =
//       FirebaseFirestore.instance.collection("LiveCourseList");
//   CollectionReference refHybrid =
//       FirebaseFirestore.instance.collection("HybridCourseList");

//   void getCourseTitle() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _courseTitle = vari.data()!['courseTitle'];
//     });
//   }

//   void getCourseDuration() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _courseDuration = vari.data()!['CourseDuration'];
//     });
//   }

//   void getCourseFee() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _courseFee = vari.data()!['CourseFee'];
//     });
//   }

//   void getCourseID() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _courseID = vari.data()!['CourseID'];
//     });
//   }

//   void getFacultyName() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _facultyName = vari.data()!['FacultyName'];
//     });
//   }

//   void getDate() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _dater = vari.data()!['Date'];
//     });
//   }

//   void getTime() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourselist")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _timer = vari.data()!['Time'];
//     });
//   }

//   void getVideoNumber() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("RecordedCourseList")
//         .doc(widget.courseID)
//         .get();
//     setState(() {
//       _videoNumber = vari.data()!['VideoNumber'];
//     });
//   }

//   @override
//   void initState() {
//     print('${courseid}');
//     dateText = formatCurrentDate(DateTime.now());

//     //time
//     timeText = formatCurrentLiveTime(DateTime.now());

//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       getCurrentLiveTime();
//     });
//     creatNewMeeting();
//     getCourseDuration();
//     getCourseFee();
//     getCourseID();
//     getCourseTitle();
//     getFacultyName();
//     getDate();
//     getTime();
//     getVideoNumber();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 36, 44, 59),
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: ButtonContainerWidget(
//                       curving: 10,
//                       colorindex: 0,
//                       height: 40.h,
//                       width: 40.w,
//                       child: const Center(
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Text(
//                     "Course Details",
//                     style: GoogleFonts.montserrat(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//               ButtonContainerWidget(
//                 curving: 30,
//                 colorindex: 0,
//                 height: 500.h,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'SciPro Recorded Course Details',
//                       style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     Text(_courseTitle + "    Course Details"),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Course Title :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _courseTitle,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Course SubTitle :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _courseID,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Faculty :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _facultyName,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Course Fee :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _courseFee,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Duration :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _courseDuration,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Course ID :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _courseID,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Posted Date :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _dater,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Posted Time :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _timer,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Current Video Number :',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             _videoNumber,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   Get.to(CheckOutScreen(
//                     totalPrice: 3999.00,
//                     courseID: widget.courseID,
//                     courseName: _courseTitle,
//                   ));
//                 },
//                 child: ButtonContainerWidget(
//                   curving: 30,
//                   colorindex: 4,
//                   height: 60.h,
//                   width: 200.w,
//                   child: Center(
//                     child: Text(
//                       " 🔔 Subscribe ",
//                       style: GoogleFonts.montserrat(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
