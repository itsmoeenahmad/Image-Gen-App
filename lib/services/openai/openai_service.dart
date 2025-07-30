import 'package:dart_openai/dart_openai.dart';

class OpenAIService {
  // Creating OPEN_AI client
  final client = OpenAI.instance.image;

  // Method - for creating an image
  Future<String?> generateImage(String prompt) async {
    final response = await client.create(
      model: 'dall-e-3',
      prompt: prompt,
      n: 1,
      size: OpenAIImageSize.size1024,
      responseFormat: OpenAIImageResponseFormat.url,
    );

    return response.data.first.url;
  }
}