// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../db/photo_database.dart';
import '../model/photo.dart';
import 'full_picture_screen.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late List<Photo> photos;
  bool isLoading = false;

  @override
  void initState() {
    refreshPhotos();
    super.initState();
  }

  Future refreshPhotos() async {
    setState(() => isLoading = true);
    photos = await PhotoDatabase.instance.readAllPhotos();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : photos.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No Photos Yet',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Go back to the camera',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => FullPictureScreen(
                          photoBytes: photos[index].data,
                        ),
                      ),
                    ),
                    child: Image.memory(
                      photos[index].data,
                      fit: BoxFit.cover,
                    ),
                  ),
                  itemCount: photos.length,
                ),
    );
  }
}
