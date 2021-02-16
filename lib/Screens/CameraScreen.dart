import 'package:camera/camera.dart';
import 'package:chatapp/Screens/CameraView.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'VideoView.dart';

List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;

  Future<void> cameraValue;
  String videoPath = "";
  bool icon = false;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {}),
                      GestureDetector(
                        onTap: () {
                          if (!_cameraController.value.isRecordingVideo) {
                            takePhoto(context);
                          }
                        },
                        onLongPress: () async {
                          String path = await recordVideo();
                          setState(() {
                            videoPath = path;
                            icon = true;
                          });
                        },
                        onLongPressUp: () async {
                          await _cameraController.stopVideoRecording();
                          setState(() {
                            icon = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoViewPage(
                                        path: videoPath,
                                      )));
                        },
                        child: icon
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await _cameraController.takePicture(path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: path,
                )));
  }

  Future<String> recordVideo() async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await _cameraController.startVideoRecording(path);
    return path;
  }
}
