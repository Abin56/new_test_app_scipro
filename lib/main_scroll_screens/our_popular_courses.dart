import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/main_scroll_screens/popular_details.dart';
import 'package:scipro_application/utils/app_colors.dart';
import '../utils/responsive.dart';

class OurPopularCourses extends StatefulWidget {
  const OurPopularCourses({Key? key}) : super(key: key);

  @override
  State<OurPopularCourses> createState() => _OurPopularCoursesState();
}

class _OurPopularCoursesState extends State<OurPopularCourses> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Our Popular Courses",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenSize.height * 1 / 35),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsFirst());
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 220.h,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main2ancy.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsFirst());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("CSIR UGC LIFESCIENCES",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main6akhilmon.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsSecond());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("ICAR NET",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main6gopika.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsThird());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("CUT PG LIFESCIENCES",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Center(
                      child: Text(
                        "Our Popular Courses",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: screenSize.height * 1 / 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: screenSize.width / 3.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xecd3301e), width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width / 3.5 - 1,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/main2ancy.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 225,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xecd3301e), width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("CSIR UGC LIFESCIENCES",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    90)))),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: screenSize.width / 3.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xecd3301e), width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: screenSize.width / 3.5 - 1,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/main6akhilmon.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const PopularOnTapDetailsSecond());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 225,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xecd3301e), width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("ICAR NET",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    90)))),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: screenSize.width / 3.5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xecd3301e), width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xecd3301e),
                                    Color(0xecd3301e),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width / 3.5 - 1,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/main6gopika.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 225,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xecd3301e), width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("CUT PG LIFESCIENCES",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    90)))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: [
                      Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/mainexam1.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsFour());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("GATE EXAMS",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main8sara.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("ICMR JRF EXAMS",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.gradientFirst, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColor.gradientSecond,
                                    AppColor.gradientSecond,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width - 1,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/embed2.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const ComingSoon());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 200,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.gradientFirst,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("SCIPRO SKILLS",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    30)))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenSize.width / 3.5,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xecd3301e), width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xecd3301e),
                                  Color(0xecd3301e),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width / 3.5 - 1,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/mainexam1.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 225,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xecd3301e), width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("GATE EXAMS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 90)))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: screenSize.width / 3.5,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xecd3301e), width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xecd3301e),
                                  Color(0xecd3301e),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width / 3.5 - 1,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main8sara.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsSix());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 225,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xecd3301e), width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("ICMR-JRF EXAMS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 90)))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: screenSize.width / 3.5,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xecd3301e), width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xecd3301e),
                                  Color(0xecd3301e),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: screenSize.width / 3.5 - 1,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/embed2.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xecd3301e), width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("SCIPRO SKILLS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 90)))),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: [
                      Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.gradientFirst, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientSecond,
                                  AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/csir_course_page');
                              },
                              child: Container(
                                width: screenSize.width - 1,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/main10vishnu.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const PopularOnTapDetailsSeven());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 200,
                                  margin: EdgeInsets.all(
                                      screenSize.height * 1 / 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.gradientFirst,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.height * 1 / 10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Center(
                                      child: Text("SET EXAMS",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize:
                                                  screenSize.width * 1 / 30)))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.gradientFirst, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColor.gradientSecond,
                                    AppColor.gradientSecond,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width - 1,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/main11archanashan.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const PopularOnTapDetailsEight());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 200,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.gradientFirst,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("KPSC EXAMS",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    30)))),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.gradientFirst, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColor.gradientSecond,
                                    AppColor.gradientSecond,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width - 1,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/main12nandhana.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const PopularOnTapDetailsNine());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 200,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.gradientFirst,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("PCB-JSA",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    30)))),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.gradientFirst, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColor.gradientSecond,
                                    AppColor.gradientSecond,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/csir_course_page');
                                },
                                child: Container(
                                  width: screenSize.width - 1,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            "assets/images/gopik_language.JPG",
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const PopularOnTapDetailsTen());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 200,
                                    margin: EdgeInsets.all(
                                        screenSize.height * 1 / 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.gradientFirst,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(
                                            screenSize.height * 1 / 10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                    child: Center(
                                        child: Text("JLA-Junior",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: screenSize.width *
                                                    1 /
                                                    30)))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: screenSize.width / 3.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xecd3301e), width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/csir_course_page');
                                  },
                                  child: Container(
                                    width: screenSize.width / 3.5 - 1,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/main10vishnu.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 200,
                                      margin: EdgeInsets.all(
                                          screenSize.height * 1 / 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xecd3301e),
                                              width: 2),
                                          borderRadius: BorderRadius.circular(
                                              screenSize.height * 1 / 10),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight)),
                                      child: Center(
                                          child: Text("SET EXAMS",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      90)))),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: screenSize.width / 3.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xecd3301e), width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/csir_course_page');
                                  },
                                  child: Container(
                                    width: screenSize.width / 3.5 - 1,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/main11archanashan.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 200,
                                      margin: EdgeInsets.all(
                                          screenSize.height * 1 / 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xecd3301e),
                                              width: 2),
                                          borderRadius: BorderRadius.circular(
                                              screenSize.height * 1 / 10),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight)),
                                      child: Center(
                                          child: Text("SET EXAMS",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      90)))),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: screenSize.width / 3.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xecd3301e), width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/csir_course_page');
                                  },
                                  child: Container(
                                    width: screenSize.width / 3.5 - 1,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/main12nandhana.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 200,
                                      margin: EdgeInsets.all(
                                          screenSize.height * 1 / 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.gradientFirst,
                                              width: 2),
                                          borderRadius: BorderRadius.circular(
                                              screenSize.height * 1 / 10),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight)),
                                      child: Center(
                                          child: Text("SCIPRO LANGUAGE COURSES",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      30)))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            width: screenSize.width / 3.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.gradientFirst, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColor.gradientSecond,
                                      AppColor.gradientSecond,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/csir_course_page');
                                  },
                                  child: Container(
                                    width: screenSize.width / 3.5 - 1,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/gopik_language.JPG",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 200,
                                      margin: EdgeInsets.all(
                                          screenSize.height * 1 / 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.gradientFirst,
                                              width: 2),
                                          borderRadius: BorderRadius.circular(
                                              screenSize.height * 1 / 10),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight)),
                                      child: Center(
                                          child: Text("SCIPRO LANGUAGE COURSES",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      30)))),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
