// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widget/photo_info_panel.dart';

class FullPictureScreen extends StatelessWidget {
  const FullPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Colors.lightGreen,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (BuildContext context) => PhotoInfoPanel(
                path: imagePath,
              ),
            ),
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.info_outline),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
