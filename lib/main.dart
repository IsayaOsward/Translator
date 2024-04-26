import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController OutputController =
      TextEditingController(text: "Result Goes here");
  final translator = GoogleTranslator();
  String inputLanguage = 'en';
  String outputLanguage = 'fr';
  String inputText = '';

  Future<void> TransaltedText() async {
    final translated = await translator.translate(
      inputText,
      from: inputLanguage,
      to: outputLanguage,
    );
    setState(() {
      OutputController.text = translated.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/image.png',
              fit: BoxFit.contain,
              height: 250,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter text to translate',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2)
                )
              ),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
