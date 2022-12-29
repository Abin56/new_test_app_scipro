// ignore_for_file: curly_braces_in_flow_control_structures, file_names
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/live_room_model.dart';
import '../screens/live_classroom.dart';
import '../widgets/button_Container.dart';


class StudentWaitingRoom extends StatefulWidget {
  String courseName;
  String time;
  String roomID;
  String id;
  StudentWaitingRoom({
    Key? key,
    required this.id,
    required this.courseName,
    required this.roomID,
    required this.time,
  }) : super(key: key);

  @override
  State<StudentWaitingRoom> createState() => _StudentWaitingRoomState();
}

class _StudentWaitingRoomState extends State<StudentWaitingRoom> {
  // LiveRoomModel? newData;
  // Future checkingtrue() async {
  //   setState(() {});
  //   var checkData = await FirebaseFirestore.instance
  //       .collection("LiveCourselist")
  //       .doc(widget.id)
  //       .get();

  //   //
  //   LiveRoomModel checkingtrue =
  //       LiveRoomModelFromJson(jsonEncode(checkData.data()));
  //   log(checkingtrue.onpress.toString());
  //   return checkingtrue;
  // }

  late final dref = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;

  @override
  // void initState() {
  //   checkingtrue().then((value) {
  //     setState(() {
  //       newData = value;
  //     });
  //   });
  //   // TODO: implement initState
  //   super.initState();
  //   databaseReference = dref.child("course");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Student Waiting Room",
            style: TextStyle(color: Colors.limeAccent, fontSize: 15),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ButtonContainerWidget(
                  colorindex: 0,
                  height: 200,
                  width: double.infinity,
                  curving: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Course Name :",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.courseName,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Time :",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.time,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("LiveCourselist")
                        .doc(widget.id)
                        .snapshots(),
                    builder: (context, snapshots) {
                      LiveRoomModel checkingtrue = LiveRoomModelFromJson(
                          jsonEncode(snapshots.data!.data()));
                      return ButtonContainerWidget(
                        curving: 30,
                        colorindex: 3,
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Message",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              checkingtrue.message,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                // newData == null
                //     ? const Center(child: CircularProgressIndicator.adaptive())
                //     :

                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("LiveCourselist")
                        .doc(widget.id)
                        .snapshots(),
                    builder: (context, snapshots) {
                      LiveRoomModel checkingtrue = LiveRoomModelFromJson(
                          jsonEncode(snapshots.data!.data()));
                      if (checkingtrue.onpress == true) {
                        // return Visibility(
                        //   visible: newData!.onpress,
                        //   child:
                        // );
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiveClassRoom(
                                            roomID: widget.roomID,
                                          )));
                            },
                            child: ButtonContainerWidget(
                              curving: 30,
                              colorindex: 2,
                              height: 50,
                              width: 120,
                              child: const Center(
                                child: Text(
                                  "Enter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ));
                      } else {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
