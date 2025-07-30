import 'package:flutter/cupertino.dart';
import 'package:imagegen/services/openai/openai_service.dart';

class CreateImageProvider extends ChangeNotifier {
  final openAIService = OpenAIService();

  bool isLoading = false;
  String generatedImageURL = '';

  Future<void> generateImage(String prompt) async {
    isLoading = true;
    notifyListeners();

    try {
      final genImageUrl = await openAIService.generateImage(prompt);
      generatedImageURL = genImageUrl!;
    } catch (e) {
      generatedImageURL = '';
      debugPrint('Error: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}
