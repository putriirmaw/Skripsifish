import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MaterialApp(
  home: CameraPage(),
));

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;

  @override
  void initState(){
    super.initState();
    widgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose(){
    widgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeApplifecycleState(AppLifecycleState state){
    if(state == AppLifecycleState.resumed)
      _initController = _controller != null ? _controller.initialize() : null ;
    if(!mounted)
      return;
    setState(() {
      isCameraReady = true;
    })
  }

  Widget camera
}