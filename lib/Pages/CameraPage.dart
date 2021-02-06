import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<CameraDescription> cameras;

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraHome();
  }
}

class CameraHome extends StatefulWidget {
  @override
  _CameraHomeState createState() => _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> {
  CameraController _controller;
  int _cameraIndex = 0;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _initCamera(_cameraIndex);
  }

  _initCamera(int index) async {
    _controller = CameraController(
      cameras[index],
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(bottom: 5, top: 5),
              child: Column(
                children: <Widget>[
                  _buildCameraControls(),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Hold for video, tap for photo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCameraControls() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.flash_off,
              size: 28,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          GestureDetector(
            child: Icon(
              Icons.panorama_fish_eye,
              size: 70.0,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.flip_camera_ios,
              size: 28,
            ),
            color: Colors.white,
            highlightColor: Colors.green,
            splashColor: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
