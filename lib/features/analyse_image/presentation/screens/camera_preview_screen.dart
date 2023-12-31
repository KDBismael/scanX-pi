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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.black),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(widget.cameras);
                        },
                      )),
                      Expanded(
                          child: IconButton(
                        onPressed: () async {
                          XFile picture = await _controller.takePicture();
                          print(picture);
                        },
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      )),
                      const Spacer(),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
