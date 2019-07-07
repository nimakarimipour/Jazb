import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraTestPage extends StatefulWidget {
  @override
  _CameraTestPageState createState() => _CameraTestPageState();
}

class _CameraTestPageState extends State<CameraTestPage> {
  List<CameraDescription> cameras;

  Future getTheListOfCameras() async {
    cameras = await availableCameras();
    print(cameras);
  }

  @override
  void initState() {
    super.initState();
    getTheListOfCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camer Test Page'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              print(cameras);
            },
            child: Text(
              'View Cameras List',
            ),
          ),
        ),
      ),
    );
  }
}
