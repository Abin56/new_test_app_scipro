// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scipro_application/signin/student_faculty_login_screen.dart';

class FacultyHomePage extends StatefulWidget {
  String imagePath;
  String? name,
      place,
      subject,
      email,
      ifsc,
      mobilrnumber,
      bankaccountnumber,
      bank,
      imageUrl;
  FacultyHomePage(
      {Key? key,
      required this.imagePath,
      this.name,
      this.place,
      this.subject,
      this.imageUrl,
      this.mobilrnumber,
      this.ifsc,
      this.bank,
      this.bankaccountnumber,
      this.email})
      : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  var loginUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController ifsc = TextEditingController();
    TextEditingController mobilenumber = TextEditingController();
    TextEditingController aadharnumber = TextEditingController();
    TextEditingController bankaccountnumber = TextEditingController();
    TextEditingController bank = TextEditingController();

    final userId = FirebaseAuth.instance.currentUser!.uid;

    CollectionReference ref =
        FirebaseFirestore.instance.collection('Faculties');



    return Scaffold(
        //backgroundColor: Colors.blueAccent,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: const Text('Create Faculties '),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                //margin: const EdgeInsets.only(top: 2),
                color: const Color(0xFF49a9f8),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(120)),
                        image: DecorationImage(
                            image: NetworkImage(widget.imagePath),
                            fit: BoxFit.contain),
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 205, 202))),
                  ),
                  SizedBox(
                    height: 800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          onSubmitted: (value) {},
                          controller: name,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              hintText: "Faculty Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: place,
                          decoration: InputDecoration(
                              hintText: "Place",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: subject,
                          decoration: InputDecoration(
                              hintText: "Subject",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: mobilenumber,
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: aadharnumber,
                          decoration: InputDecoration(
                              hintText: "Adhaar Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: bankaccountnumber,
                          decoration: InputDecoration(
                              hintText: "Bank Account Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: bank,
                          decoration: InputDecoration(
                              hintText: "Bank Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        TextField(
                          controller: ifsc,
                          decoration: InputDecoration(
                              hintText: "IFSC Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      //uploadFile();
                      ref.doc(userId).set({
                        'imageUrl': widget.imagePath,
                        'Name': name.text,
                        'place': place.text,
                        'subject': subject.text,
                        'email': email.text,
                        'mobilenumber': mobilenumber.text,
                        'bankaccount number': bankaccountnumber.text,
                        'bank': bank.text,
                        'ifsc': ifsc.text,
                        'aadhar': aadharnumber.text,
                      }).whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const StudentandFacultyLoginScreen()));
                      });
                    },
                    child: const Text("save",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.red)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]))));
  }
}
