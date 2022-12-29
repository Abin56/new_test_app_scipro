import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scipro_application/faculty_screens/faculty_livemeet.dart';
import 'package:scipro_application/widgets/button_Container.dart';
import 'package:url_launcher/url_launcher.dart';

class NewWaitingRoomScreen extends StatefulWidget {
  bool activate = false;
  String id;
  String roomid;
  var checking;
  NewWaitingRoomScreen({ required this.roomid, required this.id, super.key});

  @override
  State<NewWaitingRoomScreen> createState() => _NewWaitingRoomScreenState();
}

class _NewWaitingRoomScreenState extends State<NewWaitingRoomScreen> {
  TextEditingController sheduled_time = TextEditingController();
  TextEditingController msge = TextEditingController();
  late final dref = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh : mm : ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    databaseReference = dref.child("course");
    //date
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  final Uri toLaunch = Uri(scheme: 'https', host: 'test.scipro.in', path: '');
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    log(widget.checking.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Waiting Room"),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            ButtonContainerWidget(
              curving: 0,
              colorindex: 0,
              height: 230,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeText,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    dateText,
                    style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 26, 26, 26),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  widget.activate == true
                      ? Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Activated the class is ON',
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 42, 7),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text('')
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: msge,
              decoration: InputDecoration(
                  hintText: "Message for students",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            TextButton.icon(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("LiveCourselist")
                      .doc(widget.id)
                      .update({'message': msge.text}).then((value) {
                    Get.snackbar("Message", ' You are not Subscribed',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        messageText: Text(
                          'Message has sented to student',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ));
                  });
                  ;
                },
                icon: const Icon(Icons.send),
                label: const Text("Sent")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Get.snackbar("Activated", ' You are not Subscribed',
                //     backgroundColor: Colors.green,
                //     colorText: Colors.white,
                //     messageText: Text(
                //       'Class is Activated',
                //       style: GoogleFonts.montserrat(
                //           color: Colors.white,
                //           fontSize: 12,
                //           fontWeight: FontWeight.w700),
                //     ));

                FirebaseFirestore.instance
                    .collection("LiveCourselist")
                    .doc(widget.id)
                    .update({'onpress': true}).then((value) {
                  Get.snackbar("Activated", ' You are not Subscribed',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      messageText: Text(
                        'Class is Activated',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ));
                });
                setState(() {
                  widget.activate = true;
                });
              },
              child: ButtonContainerWidget(
                curving: 0,
                colorindex: 4,
                height: 60,
                width: 200,
                child: Center(
                  child: Text(
                    'Activate Class',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                FirebaseFirestore.instance
                    .collection("LiveCourselist")
                    .doc(widget.id)
                    .update({'onpress': false}).then((value) {
                  Get.snackbar("Dectivated", ' You are not Subscribed',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      messageText: Text(
                        'Class is Dectivated',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ));
                });
                setState(() {
                  widget.activate = false;
                });
              },
              child: ButtonContainerWidget(
                curving: 0,
                colorindex: 5,
                height: 60,
                width: 200,
                child: Center(
                  child: Text(
                    'Deactivate Class room',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            widget.activate == true
                ? GestureDetector(
                    onTap: () {
                      Get.to(LiveClassRoomFaculty(roomID: widget.roomid));
                    },
                    child: ButtonContainerWidget(
                      curving: 2,
                      colorindex: 2,
                      height: 60,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Start Class',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                : Text('')
          ],
        )));
  }
}
