import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<StatefulWidget> createState() {
    return _CameraPreviewScreenState();
  }
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  final ImagePicker _picker = ImagePicker();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRearCameraSelected = true;
  bool isFlashOn = false;
  double zoomLevel = 1;
  XFile? capturedPicture;
  double exposureValue = 0.0;
  ExposureMode exposureMode = ExposureMode.auto;
  List<double> exposureOffset = [-1.0, -0.5, 0.0, 0.5, 1.0];

  void initCamera(List<CameraDescription> cameras) {
    _controller = CameraController(
      cameras[_isRearCameraSelected ? 0 : 1],
      ResolutionPreset.medium,
      enableAudio: false,
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
    print(capturedPicture);
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
      _controller.setFlashMode(FlashMode.always);
      setState(() {
        isFlashOn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
                          child: !isFlashOn
                              ? Icon(Icons.flash_off, color: Colors.white)
                              : Icon(Icons.flash_on, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(children: [
                          GestureDetector(
                              child: Container(
                                height: zoomLevel == 1 ? 20 * 1.5 : 20,
                                width: zoomLevel == 1 ? 20 * 1.5 : 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Center(
                                  child: Text(
                                    "0,5${zoomLevel == 1 ? 'X' : ''}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                              onTap: () {
                                _controller.setZoomLevel(1);
                                setState(() {
                                  zoomLevel = 1;
                                });
                              }),
                          const SizedBox(width: 8),
                          GestureDetector(
                            child: Container(
                              height: zoomLevel == 1.5 ? 20 * 1.5 : 20,
                              width: zoomLevel == 1.5 ? 20 * 1.5 : 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Center(
                                child: Text(
                                  "1${zoomLevel == 1.5 ? 'X' : ''}",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            onTap: () {
                              _controller.setZoomLevel(1.5);
                              setState(() {
                                zoomLevel = 1.5;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            child: Container(
                              height: zoomLevel == 2 ? 20 * 1.5 : 20,
                              width: zoomLevel == 2 ? 20 * 1.5 : 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Center(
                                child: Text(
                                  "2${zoomLevel == 2 ? 'X' : ''}",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            onTap: () {
                              _controller.setZoomLevel(2);
                              setState(() {
                                zoomLevel = 2;
                              });
                            },
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                CameraPreview(_controller),
                Expanded(
                  child: Container(
                    height: screenSize.height * 0.28,
                    //                     borderRadius:
                    // BorderRadius.vertical(top: Radius.circular(24)),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slider(
                            value: exposureValue,
                            min: -1.0,
                            max: 1.0,
                            label: "$exposureValue",
                            divisions: 4,
                            onChangeEnd: (value) =>
                                _controller.setExposureOffset(value),
                            onChanged: (newVal) {
                              setState(() {
                                exposureValue = newVal;
                              });
                            }),
                        SizedBox(height: screenSize.height * 0.02),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.01),
                          width: screenSize.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Photo",
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: capturedPicture != null
                                      ? GestureDetector(
                                          onTap: () async {
                                            final image =
                                                await _picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              if (image != null) {
                                                capturedPicture = image;
                                              }
                                            });
                                          },
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle),
                                            height: screenSize.height * 0.07,
                                            width: screenSize.height * 0.07,
                                            child: Image.file(
                                              File(capturedPicture!.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container()),
                              Expanded(
                                child: IconButton(
                                  onPressed: () async {
                                    XFile picture =
                                        await _controller.takePicture();
                                    setState(() {
                                      capturedPicture = picture;
                                    });
                                    await Gal.putImage(picture.path);
                                  },
                                  iconSize: screenSize.height * 0.09,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: const Icon(Icons.circle,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  iconSize: screenSize.height * 0.04,
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
                                ),
                              ),
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
