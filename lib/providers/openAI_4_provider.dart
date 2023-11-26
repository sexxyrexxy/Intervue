import 'dart:convert';
import 'dart:html' as html;
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class openAIProvider {
  Future<String> sendImageToGPT4Vision({
    required html.File file,
    int maxTokens = 50,
    String model = "gpt-4-vision-preview",
  }) async {
    // await encodeImage(file);
    try {
      final _dio = Dio();
      final response = await _dio.post(
        "https://api.openai.com/v1/chat/completions",
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer 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',
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: jsonEncode({
          'model': model,
          'messages': [
            {
              'role': 'system',
              'content': 'You have to give concise and short answers'
            },
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text':
                      'GPT, your task is summarize the resume of candidate that I am about to give you. Analyze the document, and detect names, telephone number, email, list of experience and skils. Respond strictly with the fields in a numbred list, and nothing else—no explanations, no additional text. ',
                },
                {
                  'type': 'image_url',
                  'image_url': {
                    'url': file
                  },
                },
              ],
            },
          ],
          'max_tokens': maxTokens,
        }),
      );

      final jsonResponse = response.data;

      print(jsonResponse);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      return jsonResponse["choices"][0]["message"]["content"];
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> encodeImage(html.File image) async {
   final reader = html.FileReader();
      reader.readAsArrayBuffer(image);

      await reader.onLoad.first;

      final List<int> bytes = Uint8List.fromList(reader.result as List<int>);

      return base64Encode(bytes);
  }
}
