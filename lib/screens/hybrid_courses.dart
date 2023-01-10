import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HybridCourses extends StatefulWidget {
  int inVoiceNumber = 0;
  HybridCourses({Key? key}) : super(key: key);

  @override
  State<HybridCourses> createState() => _HybridCoursesState();
}

class _HybridCoursesState extends State<HybridCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text(
        //   'Coming Soon............',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        // ),
        child: IconButton(
            onPressed: () async {
              var vari = await FirebaseFirestore.instance
                  .collection("InvoiceNumber")
                  .doc("integer")
                  .get();
              setState(() {
                widget.inVoiceNumber = vari.data()!['number'];
                var newData = widget.inVoiceNumber + 1;
                FirebaseFirestore.instance
                    .collection("InvoiceNumber")
                    .doc("integer")
                    .update({"number": newData});
              });
              log(widget.inVoiceNumber.toString());
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
