import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:imagegen/core/reusable%20widgets/show_message.dart';
import '../../features/result/domain/provider/download_image_provider.dart';

Future<void> downloadImageIOS(context, String url) async {
  // Download Image Provider Class Instance
  final downloadImageProviderInstance = Provider.of<DownloadImageProvider>(
    context, listen: false
  );

  try {
    // Ask for Photos permission
    var status = await Permission.photos.request();
    if (!status.isGranted) {
      print("Permission denied");
      return;
    }

    // Downloading image using Dio
    final dio = Dio();
    final response = await dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    // Convert to Uint8List
    final Uint8List bytes = Uint8List.fromList(response.data!);

    // Saving to ios_photos
    final result = await ImageGallerySaver.saveImage(
      bytes,
      quality: 100,
      name: "generated_image",
    );
    // Removing the loading
    downloadImageProviderInstance.changeStatus();
    // Showing the message
    showMessage(
      context,
      'Image Saved Successfully!',
      AppColors.textColor,
      AppColors.textFieldBgColor,
    );
  } catch (e) {
    print("Error downloading image: $e");
    showMessage(
      context,
      'Error Downloading Image: ${e}',
      AppColors.textColor,
      AppColors.textFieldBgColor,
    );
  }
}
