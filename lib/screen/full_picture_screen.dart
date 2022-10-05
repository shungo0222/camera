// Dart imports:
import 'dart:typed_data';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../db/photo_database.dart';
import '../widget/photo_info_panel.dart';

class FullPictureScreen extends StatelessWidget {
  const FullPictureScreen({
    Key? key,
    required this.photoId,
    required this.photoBytes,
    required this.time,
    required this.refreshFunc,
  }) : super(key: key);

  final int photoId;
  final Uint8List photoBytes;
  final DateTime time;
  final Function refreshFunc;

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
              builder: (BuildContext context) => PhotoInfoPanel(
                time: time,
              ),
            ),
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.info_outline),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {
              showDialog<dynamic>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'DELETE THIS PHOTO',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content:
                      const Text('Are you sure you want to delete this photo?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: const Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () async {
                        await PhotoDatabase.instance.delete(photoId);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        await refreshFunc();
                      },
                    ),
                  ],
                ),
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
