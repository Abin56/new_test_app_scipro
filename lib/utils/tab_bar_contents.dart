// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.red.withOpacity(widget.opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Image.asset("assets/images/SCIPRO.png",height: 50,width: 100,),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: screenSize.width / 30),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[0] = true
                                  : _isHovering[0] = false;
                            });
                          },
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.phone,color: Colors.red,),
                                  Text(
                                    '+91 9048900024',
                                    style: TextStyle(
                                      color: _isHovering[0]
                                          ? Colors.blue.shade200
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _isHovering[0],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[1] = true
                                  : _isHovering[1] = false;
                            });
                          },
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(

                                children: [
                                  const Icon(Icons.mail,color: Colors.red,),
                                  Text(
                                    'info@scipro.in',
                                    style: TextStyle(
                                      color: _isHovering[1]
                                          ? Colors.blue[200]
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _isHovering[1],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: _isHovering[2] ? Colors.white : Colors.red,
                        fontSize: screenSize.width*1/60
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width / 15,
                  ),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          value ? _isHovering[3] = true : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Image.asset("assets/images/frdd.png",height:20,width:20,)
                  ),
                  SizedBox(width: screenSize.width*1/70,),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          value ? _isHovering[3] = true : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Image.asset("assets/images/utube.png",height:20,width:20,)
                  ),
                  SizedBox(width: screenSize.width*1/70,),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          value ? _isHovering[3] = true : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Image.asset("assets/images/instag.png",height:20,width:20,)
                  ),
                  SizedBox(width: screenSize.width*1/70,),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[3] = true : _isHovering[3] = false;
                      });
                    },
                    onTap: () {},
                    child: Image.asset("assets/images/twitt.png",height:20,width:20,)
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
