import 'package:flutter/material.dart';
import 'package:dart_openai/dart_openai.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});
  static const routeName = '/home';

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    // exampleAI();
    return Container();
  }

  Future<void> exampleAI() async {
    // Set the OpenAI API key from the .env file.
    OpenAI.apiKey = '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';

    // Start using!
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: """
                I am interviewing a candidate for software engineer. 
                The question is what language do you know. The response is I know flutter, 
                and I have made a few apps with Flutter. What follow up question should I ask? 
                Please give me a very specific follow up qeustion.
                """,
    );
    print(completion.choices[0].text);
  }
}
