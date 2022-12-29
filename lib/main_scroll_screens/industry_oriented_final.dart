
import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class IndustryOrientedFinal extends StatefulWidget {
  const IndustryOrientedFinal({Key? key}) : super(key: key);

  @override
  State<IndustryOrientedFinal> createState() => _IndustryOrientedFinalState();
}

class _IndustryOrientedFinalState extends State<IndustryOrientedFinal> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Industry Oriented Courses",
            style:
            TextStyle(
              color: Colors.red,
              fontSize: screenSize.height*1/25,
            ),
          ),
        ),
        Center(
          child: ResponsiveWidget.isSmallScreen(context)
          ?
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/drone_1.png",
                        width: screenSize.width-40,
                      height: screenSize.height/2,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/embed1.jpg",
                        width: screenSize.width-40,
                        height: screenSize.height/2,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xecd3301e),width: 2),
                    borderRadius: BorderRadius.circular(2),
                    gradient: const LinearGradient(
                        colors: [Colors.white,
                          Colors.white,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight
                    )
                ),
                  //color: Colors.white,
                  child: Text("The Industry Orineted concept being unique ,focuses onprofile mapping,\n "
                      "skill gap analysis,industry analysis and traing the students...Read More ",
                    style:
                    TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.height*1/40,
                    ),
                  ),
                )
              ],

        )
              :
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/drone_1.png"),
                      Image.asset("assets/images/embed1.jpg"),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xecd3301e),width: 2),
                        borderRadius: BorderRadius.circular(2),
                        gradient: const LinearGradient(
                            colors: [Colors.white,
                              Colors.white,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                        )
                    ),
                    child: Text("The Industry Oriented concept being unique ,focuses on profile mapping,\n "
                        "skill gap analysis,industry analysis and trading the students...Read More ",
                      style:
                      TextStyle(
                        color: Colors.black,
                        fontSize: screenSize.height*1/35,
                      ),
                    ),
                  )
                ],
              )

        ),
      ],
    );
  }
}
