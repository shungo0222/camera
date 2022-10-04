// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';

// Project imports:
import '../db/photo_database.dart';
import '../model/photo.dart';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final XFile image;

  @override
  Widget build(BuildContext context) {
    Future<void> _save() async {
      final photoBytes = await image.readAsBytes();
      final Photo photo = Photo(
        data: photoBytes,
        time: DateTime.now(),
        latitude: 100,
        longitude: 100,
      );
      await PhotoDatabase.instance.create(photo);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Saved!!',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.file(
          File(image.path),
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () async {
              await _save();
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.deepPurpleAccent,
            child: const Icon(Icons.save_alt),
          ),
        ],
      ),
    );
  }
}
