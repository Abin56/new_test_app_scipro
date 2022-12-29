import 'package:flutter/material.dart';

class JoinedCourses extends StatelessWidget {
  const JoinedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
             SizedBox(
              width: screenSize.width,
              child:
                  Stack(
                      children: [

                        Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/secondtext.jpg"),
                  Text("Our Popular Courses ",
                    style: TextStyle(
                      fontSize: screenSize.height*1/25,
                      color: Colors.red,
                    ),), //Center(
                    //child:
                    Container(
                      padding: EdgeInsets.only(top: screenSize.width*1/40),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children:
                        [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xecd3301e),width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Color(0xecd3301e),
                                              Color(0xecd3301e),
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap:() {
                                            Navigator.pushNamed(context, '/csir_course_page');
                                          },
                                          child:
                                          Container(
                                            width: screenSize.width*1/4.1,
                                            height: screenSize.width*1/8,
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  image: AssetImage("assets/images/main2ancy.jpg",
                                                  ),
                                                fit: BoxFit.cover
                                              ),
                                                borderRadius: BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                    colors: [Colors.white,
                                                      Colors.white,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight
                                                )
                                            ),

                                          ),
                                        ),
                                        Container(
                                          width: screenSize.width*1/4,
                                          //color: Color(0xecd3301e),
                                          height: screenSize.width*1/33,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: const Color(0xecd3301e),width: 2),
                                              borderRadius: BorderRadius.circular(10),
                                              gradient: const LinearGradient(
                                                  colors: [Color(0xecd3301e),
                                                    Color(0xecd3301e),
                                                  ],
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight
                                              )
                                          ),

                                          child: Center(
                                            child: Text("CSIR UGC LIFESCIENCE",
                                              style: TextStyle(
                                                  fontSize: screenSize.width*1/80,
                                                  //fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 30,),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/main6akhilmon.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  //color: Color(0xecd3301e),
                                  height: screenSize.width*1/33,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xecd3301e),width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Color(0xecd3301e),
                                            Color(0xecd3301e),
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),

                                  child: Center(
                                    child: Text("CUET PG LIFESCIENCE",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30,),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/main6gopika.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  //color: Color(0xecd3301e),
                                  height: screenSize.width*1/33,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xecd3301e),width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          colors: [Color(0xecd3301e),
                                            Color(0xecd3301e),
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight
                                      )
                                  ),

                                  child: Center(
                                    child: Text("ICAR NET",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30,),

                        ],
                      ),
                    ),
                  //),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          Container(
                            width: screenSize.width*1/4,
                            decoration: BoxDecoration(
                                border: Border.all(color:const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/mainexam1.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  color: const Color(0xecd3301e),
                                  height: screenSize.width*1/33,

                                  child: Center(
                                    child: Text("GATE EXAMS",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          Container(
                            width: screenSize.width*1/4,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/main8sara.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  color: const Color(0xecd3301e),
                                  height: screenSize.width*1/33,

                                  child: Center(
                                    child: Text("ICMR-JRF EXAMS",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          Container(
                            width: screenSize.width*1/4,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/embed1.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  color: const Color(0xecd3301e),
                                  height: screenSize.width*1/33,

                                  child: Center(
                                    child: Text("SKILL DEVELOPMENT COURSES",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 10,),
                              Container(
                                width: screenSize.width*1/4,
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xecd3301e),width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                        colors: [Color(0xecd3301e),
                                          Color(0xecd3301e),
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight
                                    )
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap:() {
                                        Navigator.pushNamed(context, '/csir_course_page');
                                      },
                                      child:
                                      Container(
                                        width: screenSize.width*1/4.1,
                                        height: screenSize.width*1/8,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/main10vishnu.jpg",
                                                ),
                                                fit: BoxFit.cover
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                                colors: [Colors.white,
                                                  Colors.white,
                                                ],
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight
                                            )
                                        ),

                                      ),
                                    ),
                                    Container(
                                      width: screenSize.width*1/3.5,
                                      color: const Color(0xecd3301e),
                                      height: screenSize.width*1/33,

                                      child: Center(
                                        child: Text("SET EXAMS",
                                          style: TextStyle(
                                              fontSize: screenSize.width*1/80,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          Container(
                            width: screenSize.width*1/4,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/main11archanashan.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  color: const Color(0xecd3301e),
                                  height: screenSize.width*1/33,

                                  child: Center(
                                    child: Text("KERALA PSC EXAMS",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          Container(
                            width: screenSize.width*1/4,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xecd3301e),width: 2),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [Color(0xecd3301e),
                                      Color(0xecd3301e),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight
                                )
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.pushNamed(context, '/csir_course_page');
                                  },
                                  child:
                                  Container(
                                    width: screenSize.width*1/4.1,
                                    height: screenSize.width*1/8,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage("assets/images/main12nandhana.jpg",
                                            ),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight
                                        )
                                    ),

                                  ),
                                ),
                                Container(
                                  width: screenSize.width*1/3.5,
                                  color: const Color(0xecd3301e),
                                  height: screenSize.width*1/33,

                                  child: Center(
                                    child: Text("UPSC EXAMS",
                                      style: TextStyle(
                                          fontSize: screenSize.width*1/80,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30,),
                    ],
                  ),
                ],
              ),
      ])
            ),
          ],
      ),
    );
  }
}
