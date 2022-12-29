// ignore_for_file: library_private_types_in_public_api

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
   final String name,mediaUrl;

  const VideoScreen({super.key, required this.name, required this.mediaUrl});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {

    BetterPlayerConfiguration betterPlayerConfiguration =
    const BetterPlayerConfiguration(aspectRatio: 16/9,fit: BoxFit.contain);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.mediaUrl);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),),
      body: Column(
        children: [
          const SizedBox(height: 8,),
          Expanded(child:
          AspectRatio(aspectRatio: 16/9,
          child: BetterPlayer(
            key: _betterPlayerKey,
            controller:_betterPlayerController ,),),
          )
        ],
      ),
    );
  }
}
