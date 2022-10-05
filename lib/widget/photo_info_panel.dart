// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

class PhotoInfoPanel extends StatelessWidget {
  const PhotoInfoPanel({
    Key? key,
    required this.time,
  }) : super(key: key);

  final DateTime time;

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
            'Date',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Divider(),
          Text(DateFormat('yyyy-MM-dd – kk:mm').format(time)),
          const SizedBox(height: 20),
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
