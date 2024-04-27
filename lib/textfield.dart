import 'package:flutter/material.dart';

class TextFieldArea extends StatelessWidget {
  final TextEditingController? Controller;
  final bool readOnly;
  final int? maxLines;
  final String? hintText; // Make hint optional

  // Constructor with optional parameters and default values
  const TextFieldArea({
    Key? key,
    this.Controller,
    this.readOnly = false,
    this.maxLines,
    this.hintText, // Make hint optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      style: const TextStyle(fontSize: 20),
      maxLines: maxLines ?? null,
      controller: Controller,
      decoration: InputDecoration(
        hintText: hintText, // Use provided hint or null
        border: OutlineInputBorder(),
      ),
    );
  }
}
