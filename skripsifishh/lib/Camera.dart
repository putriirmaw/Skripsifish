// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
//
// class CameraPage extends StatefulWidget {
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   late CameraController controller;
//   late String filePath;
//
//   Future<void> initializeCamera() async {
//     var cameras = await availableCameras();
//     controller = CameraController(cameras[0], ResolutionPreset.medium);
//     await controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   Future<File> takePicture() async {
//     Directory root = await getTemporaryDirectory();
//     String directoryPath = '${root.path}/Guided_camera';
//     await Directory(directoryPath).create(recursive: true);
//     String filePath = '$directoryPath/${DateTime.now()}.jpg';
//
//     try {
//       await controller.takePicture(filePath);
//     } catch(e){
//       return null;
//     }
//
//     return File(filePath);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(),
//     );
//   }
//
// }
