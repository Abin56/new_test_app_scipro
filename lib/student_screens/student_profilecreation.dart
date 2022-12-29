import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/getx.dart';
import '../main.dart';
import '../model/hive/profile_model.dart';
import '../signin/student_faculty_login_screen.dart';
import '../widgets/button_Container.dart';

class StudentProfleCreation extends StatelessWidget {
  final homeController = Get.put(SciProController());
  StudentProfleCreation({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController courseController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(192, 0, 0, 0),
        appBar: AppBar(
          title: Text(
            "Create Profile",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              GetBuilder<SciProController>(
                init: homeController,
                initState: (_) {},
                builder: (_) {
                  return Container(
                      height: 160,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: homeController.pickedImage == null
                          ? GestureDetector(
                              onTap: () {
                                getBottomsheet(context);
                              },
                              child: Stack(
                                children: const [
                                  Positioned(
                                      top: 110,
                                      left: 230,
                                      child: CircleAvatar(
                                        radius: 23,
                                        backgroundColor: Colors.amber,
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.black,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  FileImage(File(homeController.pickedImage!)),
                            ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the name';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter your Name',
                  hintText: ' Name',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the address';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: addressController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter your Address',
                  hintText: ' Address',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the course';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: courseController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter yourCourse',
                  hintText: 'Course',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the email';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter your email',
                  hintText: ' email',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the Phonenumber';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter your PhoneNumber',
                  hintText: ' PhoneNumber',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the pincode ';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: pincodeController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  helperText: 'Enter your PinCode',
                  hintText: ' PinCode',
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final addtoHive = DBStudentList(
                        pincode: phoneNumberController.text.trim(),
                        name: nameController.text.trim(),
                        address: addressController.text.trim(),
                        subject: courseController.text.trim(),
                        mobilenumber: phoneNumberController.text.trim(),
                        image: homeController.pickedImage!,
                        email: emailController.text.trim());
                    studentdataDB.add(addtoHive);
                    Get.offAll(StudentandFacultyLoginScreen());
                  }
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 4,
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text('Save'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getBottomsheet(context) {
    final homeController = Get.put(SciProController());
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 150.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          homeController.getGallery();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo_size_select_actual_outlined,
                          size: 45,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    IconButton(
                        onPressed: () {
                          homeController.getCamera();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo_camera_outlined,
                          size: 45,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
