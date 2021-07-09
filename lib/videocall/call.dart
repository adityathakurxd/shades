import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appId = "50fa798e7c3e441590a23cc7f77e7994";
const token = "00650fa798e7c3e441590a23cc7f77e7994IAC2BrXg+/Hsl5DRbZtLqVL2D4Vx7a8FtcwVFC0g07CK7jiw7U4AAAAAEAAPHFzYn9LpYAEAAQCe0ulg";


class CallScreen extends StatefulWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  var _remoteUid;
  RtcEngine _engine;

  @override
  void initState() {
    initForAgora();
    super.initState();
  }

  Future<void> initForAgora() async {
    await [Permission.camera, Permission.microphone].request();

    _engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));

    await _engine.enableVideo();

    _engine.setEventHandler(
        RtcEngineEventHandler(
            joinChannelSuccess: (String channel, int uid, int elapsed){
              print("Local User $uid joined");
            },
            userJoined: (int uid, int elapsed){
              print("Remote User $uid joined");
              setState(() {
                _remoteUid = uid;
              });
            },
            userOffline: (int uid, UserOfflineReason reason){
              print("Remote User $uid left channel");
              setState(() {
                _remoteUid = null;
              });
            }
        )
    );

    await _engine.joinChannel(token, "channelname", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Consultation'),
      ),
      body: Stack(
        children: [
          Center(
            child: _renderRemoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: _renderLocalPreview(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderLocalPreview(){
    return RtcLocalView.SurfaceView();
  }

  Widget _renderRemoteVideo(){
    if(_remoteUid != null){
      return RtcRemoteView.SurfaceView(uid: _remoteUid,);
    }
    else {
      return Text(
        'Doctor will appear here!',
        textAlign: TextAlign.center,
      );
    }
  }
}