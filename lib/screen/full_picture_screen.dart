// Dart imports:
import 'dart:typed_data';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widget/photo_info_panel.dart';

class FullPictureScreen extends StatelessWidget {
  const FullPictureScreen({
    Key? key,
    required this.photoBytes,
  }) : super(key: key);

  final Uint8List photoBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.memory(
          photoBytes,
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
              builder: (BuildContext context) => const PhotoInfoPanel(),
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
