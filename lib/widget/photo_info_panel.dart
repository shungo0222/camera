// Flutter imports:
import 'package:flutter/material.dart';

class PhotoInfoPanel extends StatelessWidget {
  const PhotoInfoPanel({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Infomation',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Path',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(),
          Text(path),
          const Spacer(),
          const Text(
            'Date',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(),
          const Text('Coming soon...'),
          const Spacer(),
          const Text(
            'Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(),
          const Text('Latitude: Coming soon...'),
          const Text('Longitude: Coming soon...'),
          const Spacer(),
        ],
      ),
    );
  }
}
