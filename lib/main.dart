import 'package:flutter/material.dart';
import 'package:lang_translator/languages.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController outputController =
      TextEditingController(text: "Result Goes here");
  final translator = GoogleTranslator();
  String inputText = '';
  String inputLanguage = 'en';
  String outputLanguage = 'fr';
  Future<void> transalteText() async {
    final translated = await translator.translate(
      inputText,
      from: inputLanguage,
      to: outputLanguage,
    );
    setState(() {
      outputController.text = translated.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/image.png',
              fit: BoxFit.contain,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Translate Your Text To Any Language",
                style: TextStyle(
                    color: Color.fromARGB(255, 43, 49, 152),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  hintText: 'Enter text to translate',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: inputLanguage,
                  onChanged: (newvalue) {
                    setState(() {
                      inputLanguage = newvalue!;
                    });
                  },
                  items: languageNames.entries
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item.key,
                          child: Text(item.value),
                        ),
                      )
                      .toList(),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
                DropdownButton(
                    value: outputLanguage,
                    items: languageNames.entries
                        .map(
                          (e) => DropdownMenuItem(
                              value: e.key, child: Text(e.value)),
                        )
                        .toList(),
                    onChanged: (output) {
                      setState(() {
                        outputLanguage = output!;
                      });
                    })
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: transalteText,
              style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size.fromHeight(55)),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 43, 49, 152))),
              child: const Text('Translate'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              readOnly: true,
              style: const TextStyle(fontSize: 20),
              maxLines: 8,
              controller: outputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
