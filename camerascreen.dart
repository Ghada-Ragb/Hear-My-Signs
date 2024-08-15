import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  bool checker = false;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      await _initializeControllerFuture;
      await _controller!.startVideoRecording();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Recording started"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopRecording() async {
    try {
      XFile videoFile = await _controller!.stopVideoRecording();
      await GallerySaver.saveVideo(videoFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Recording stopped"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void _toggleFlash() {
    if (_controller != null && _controller!.value.isInitialized) {
      setState(() {
        isFlashOn = !isFlashOn;
        _controller!.setFlashMode(
          isFlashOn ? FlashMode.torch : FlashMode.off,
        );
      });
    }
  }

  void _toggleCamera() {
  if (_controller != null &&
      _controller!.value.isInitialized &&
      !_controller!.value.isRecordingVideo) {
    List<CameraDescription> cameras = [];
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      int currentCameraIndex = cameras.indexOf(_controller!.description);
      int nextCameraIndex = (currentCameraIndex + 1) % cameras.length;

      _controller!.dispose();

      _controller = CameraController(
        cameras[nextCameraIndex],
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller!.initialize();
      checker = true;
      setState(() {});
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F4F9),
      appBar: AppBar(
        backgroundColor: Color(0xff6FA1A2),
        title: Padding(
          padding: const EdgeInsets.only(left: 170),
          child: Text(
            "Use Camera",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
      ),
      body: checker
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller!);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          : Container(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _toggleFlash,
              child: Icon(
                isFlashOn ? Icons.flash_on : Icons.flash_off,
                color: Color(0xff6FA1A2),
              ),
            ),
            SizedBox(width: 16.0),
            FloatingActionButton(
              backgroundColor: Color(0xff6FA1A2),
              onPressed: () {
                _controller!.value.isRecordingVideo
                    ? _stopRecording()
                    : _startRecording();
              },
              shape: CircleBorder(),
              child: checker
                  ? Icon(
                      _controller!.value.isRecordingVideo
                          ? Icons.stop
                          : Icons.videocam,
                    )
                  : Container(),
            ),
            SizedBox(width: 16.0),
            TextButton(
              onPressed: _toggleCamera,
              child: Icon(
                Icons.switch_camera,
                color: Color(0xff6FA1A2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void init() {
    availableCameras().then((cameras) async {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller!.initialize();
      checker = true;
      setState(() {});
    });
  }
}

