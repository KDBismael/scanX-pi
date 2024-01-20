import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<StatefulWidget> createState() {
    return _CameraPreviewScreenState();
  }
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRearCameraSelected = true;
  bool isFlashOn = false;
  Offset? focusPoint;
  double zoomLevel = 1.0;
  XFile? capturedPicture;

  void initCamera(List<CameraDescription> cameras) {
    _controller = CameraController(
      cameras[_isRearCameraSelected ? 0 : 1],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  void toggleCameraFlash() {
    if (isFlashOn) {
      _controller.setFlashMode(FlashMode.off);
      setState(() {
        isFlashOn = false;
      });
    } else {
      _controller.setFlashMode(FlashMode.torch);
      setState(() {
        isFlashOn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {
                            toggleCameraFlash();
                          },
                          child: isFlashOn
                              ? Icon(Icons.flash_off, color: Colors.white)
                              : Icon(Icons.flash_on, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.rotate_right, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                CameraPreview(_controller),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    //                     borderRadius:
                    // BorderRadius.vertical(top: Radius.circular(24)),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Photo",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Expanded(
                                  child: IconButton(
                                onPressed: () async {
                                  XFile picture =
                                      await _controller.takePicture();
                                  print(picture);
                                },
                                iconSize: 50,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(Icons.circle,
                                    color: Colors.white),
                              )),
                              Expanded(
                                  child: IconButton(
                                padding: EdgeInsets.zero,
                                iconSize: 30,
                                icon: Icon(
                                    _isRearCameraSelected
                                        ? CupertinoIcons.switch_camera
                                        : CupertinoIcons.switch_camera_solid,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() => _isRearCameraSelected =
                                      !_isRearCameraSelected);
                                  initCamera(widget.cameras);
                                },
                              )),
                            ]),
                      ],
                    ),
                  ),
                ),
              ]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
