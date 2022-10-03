// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'provider/photo.dart';
import 'screen/take_picture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Photo()),
      ],
      child: MaterialApp(
        title: 'Camera',
        debugShowCheckedModeBanner: false,
        home: TakePictureScreen(camera: camera),
      ),
    );
  }
}
