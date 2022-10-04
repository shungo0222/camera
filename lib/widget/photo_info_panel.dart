// Flutter imports:
import 'package:flutter/material.dart';

class PhotoInfoPanel extends StatelessWidget {
  const PhotoInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Infomation',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Date',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(),
          Text('Coming soon...'),
          Spacer(),
          Text(
            'Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(),
          Text('Latitude: Coming soon...'),
          Text('Longitude: Coming soon...'),
          Spacer(),
        ],
      ),
    );
  }
}
