import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controllers/getx.dart';
import 'package:scipro_application/model/video_model.dart';
import 'package:scipro_application/video_player/video_screen.dart';

final ScrollController _scrollController = ScrollController();

class RecordedvideosPlayList extends StatelessWidget {
  final getxController = Get.put(SciProController());
  var catData;
  RecordedvideosPlayList({required this.catData, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    log(catData);
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: AnimationLimiter(
          child: GetBuilder<SciProController>(
              init: getxController,
              initState: (_) {},
              builder: (_) {
                return getxController.categoryCollections.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                      )
                    : StreamBuilder(
                        stream: getxController.getProduct(catData),
                        builder: (context,
                            AsyncSnapshot<List<VideoFectingModel>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              cacheExtent: 9999,

                              controller: _scrollController,
                              padding: EdgeInsets.all(_w / 30),
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: snapshot.data!.length,
                              //////
                              //video Length.................
                              ///
                              itemBuilder: (BuildContext context, int index) {
                                final data = snapshot.data![index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  delay: const Duration(milliseconds: 100),
                                  child: SlideAnimation(
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    horizontalOffset: 30,
                                    verticalOffset: 300.0,
                                    child: FadeInAnimation(
                                      curve:
                                          Curves.fastLinearToSlowEaseIn.flipped,
                                      duration:
                                          const Duration(milliseconds: 3000),
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(bottom: _w / 15),
                                        height: _w / 4,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                onTap: () {
                                                  Get.to(VideoScreen(
                                                      name: data.videoName,
                                                      mediaUrl:
                                                          data.videoPath));
                                                },
                                                //     Navigator.of(context).push(
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         AllvideoPlayer(
                                                //       urls: fetchedVideosPath,
                                                //       index: index,
                                                //     ),
                                                //   ),
                                                // ),
                                                title: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        height: 200,
                                                        child: Text(
                                                          data.videoName
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                leading: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: SizedBox(
                                                      height: 200,
                                                      width: 90,
                                                      child: Center(
                                                          child: data.videoImage
                                                                  .isEmpty
                                                              ? const CircularProgressIndicator
                                                                  .adaptive()
                                                              : Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      image: NetworkImage(
                                                                          data.videoImage),
                                                                    ),
                                                                  ),
                                                                ))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            );
                          }
                        });
              })),
    );
  }
}
