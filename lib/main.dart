// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front);

  runApp(MyApp(frontCamera: frontCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription frontCamera;

  MyApp({required this.frontCamera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(frontCamera: frontCamera),
    );
  }
}
