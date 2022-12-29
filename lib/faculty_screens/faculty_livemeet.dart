// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';

class LiveClassRoomFaculty extends StatefulWidget {
  String roomID;
  final studentname = FirebaseAuth.instance.currentUser!.displayName;
  LiveClassRoomFaculty({
    Key? key,
    required this.roomID,
  }) : super(key: key);

  @override
  State<LiveClassRoomFaculty> createState() => _LiveClassRoomFacultyState();
}

class _LiveClassRoomFacultyState extends State<LiveClassRoomFaculty> {
  //final serverText = TextEditingController(text: "https://test.scipro.in/");
  final roomText = TextEditingController(text: "");
  final subjectText = TextEditingController(text: "");
  final nameText = TextEditingController(text: "");
  final emailText = TextEditingController(text: "");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: kIsWeb
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.30,
                      child: meetConfig(),
                    ),
                    SizedBox(
                        width: width * 0.60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.white54,
                              child: SizedBox(
                                width: width * 0.60 * 0.70,
                                height: width * 0.60 * 0.70,
                                child: JitsiMeetConferencing(
                                  extraJS: const [
                                    // extraJs setup example
                                    '<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>'
                                  ],
                                ),
                              )),
                        ))
                  ],
                )
              : meetConfig(),
        ),
      ),
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 16.0,
          ),
          //TextField(
          //controller: serverText,
          // decoration: InputDecoration(
          //      border: OutlineInputBorder(),
          //      labelText: "Server URL",
          //       hintText: "Hint: Leave empty for meet.jitsi.si"),
          // ),
          const SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: roomText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.roomID,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),

          const SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: nameText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.studentname,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Audio Only"),
            value: isAudioOnly,
            onChanged: _onAudioOnlyChanged,
          ),
          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Audio Muted"),
            value: isAudioMuted,
            onChanged: _onAudioMutedChanged,
          ),
          const SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: const Text("Video Muted"),
            value: isVideoMuted,
            onChanged: _onVideoMutedChanged,
          ),
          const Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _joinMeeting();
              },
              child: const Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    //String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;
    String serverUrl = "https://test.scipro.in/";

    Map<FeatureFlagEnum, dynamic> featureFlags = {
      FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.ANDROID_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.AUDIO_FOCUS_DISABLED: false,
      FeatureFlagEnum.AUDIO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.AUDIO_ONLY_BUTTON_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.CAR_MODE_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.CONFERENCE_TIMER_ENABLED: false,
      FeatureFlagEnum.CHAT_ENABLED: false,
      FeatureFlagEnum.FILMSTRIP_ENABLED: false,
      FeatureFlagEnum.FULLSCREEN_ENABLED: true,
      FeatureFlagEnum.HELP_BUTTON_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.IOS_RECORDING_ENABLED: true,
      FeatureFlagEnum.IOS_SCREENSHARING_ENABLED: true,
      FeatureFlagEnum.SPEAKERSTATS_ENABLED: false,
      FeatureFlagEnum.KICK_OUT_ENABLED: true,
      FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
      FeatureFlagEnum.LOBBY_MODE_ENABLED: true,
      FeatureFlagEnum.MEETING_NAME_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: false,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: false,
      FeatureFlagEnum.RAISE_HAND_ENABLED: true,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: true,
      FeatureFlagEnum.REPLACE_PARTICIPANT: false,
      FeatureFlagEnum.RESOLUTION: FeatureFlagVideoResolution.HD_RESOLUTION,
      FeatureFlagEnum.SECURITY_OPTIONS_ENABLED: false,
      FeatureFlagEnum.SERVER_URL_CHANGE_ENABLED: false,
      FeatureFlagEnum.SETTINGS_ENABLED: true,
      FeatureFlagEnum.TILE_VIEW_ENABLED: true,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.TOOLBOX_ENABLED: true,
      FeatureFlagEnum.VIDEO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.VIDEO_SHARE_BUTTON_ENABLED: true,
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb && Platform.isAndroid) {
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: roomText.text)
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "enableNoAudioDetection": true,
        "enableNoisyMicDetection": true,
        "enableClosePage": false,
        "prejoinPageEnabled": false,
        "hideConferenceTimer": true,
        "disableInviteFunctions": true,
        "chromeExtensionBanner": null,
        "configOverwrite": {
          "prejoinPageEnabled": false,
          "disableDeepLinking": true,
          "enableLobbyChat": false,
          "enableClosePage": false,
          "toolbarButtons": [
            "microphone",
            "camera",
            "hangup",
          ]
        },
        "userInfo": {"email": emailText.text, "displayName": nameText.text}
      };

    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onOpened: () {
            debugPrint("JitsiMeetingListener - onOpened");
          },
          onClosed: () {
            debugPrint("JitsiMeetingListener - onClosed");
          },
          onError: (error) {
            debugPrint("JitsiMeetingListener - onError: error: $error");
          },
          onConferenceWillJoin: (url) {
            debugPrint(
                "JitsiMeetingListener - onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("JitsiMeetingListener - onConferenceJoined: url:$url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint(
                "JitsiMeetingListener - onConferenceTerminated: url: $url, error: $error");
          },
          onParticipantLeft: (participantId) {
            debugPrint(
                "JitsiMeetingListener - onParticipantLeft: $participantId");
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint("JitsiMeetingListener - onParticipantJoined: "
                "email: $email, name: $name, role: $role, "
                "participantId: $participantId");
          },
          onAudioMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onAudioMutedChanged: muted: $muted");
          },
          onVideoMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onVideoMutedChanged: muted: $muted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint("JitsiMeetingListener - onScreenShareToggled: "
                "participantId: $participantId, isSharing: $isSharing");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("JitsiMeetingListener - readyToClose callback");
                }),
          ]),
    );
  }
}
