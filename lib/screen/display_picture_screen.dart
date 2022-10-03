import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Future<void> _saveMessage() async {
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
          File(imagePath),
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
              await _saveMessage();
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
