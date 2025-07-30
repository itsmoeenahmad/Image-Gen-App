import 'package:flutter/foundation.dart';

class DownloadImageProvider extends ChangeNotifier {
  bool isDownload = false;

  void changeStatus() {
    isDownload = !isDownload;
    notifyListeners();
  }
}
