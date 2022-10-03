// Flutter imports:
import 'package:flutter/material.dart';

class Photo with ChangeNotifier {
  final List<String> _path = [];

  List<String> get path => _path;

  void save(String path) {
    _path.add(path);
    notifyListeners();
  }
}
