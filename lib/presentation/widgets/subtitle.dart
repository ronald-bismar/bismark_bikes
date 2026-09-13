import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final Color colorText;
  const Subtitle({
    required this.text,
    this.colorText = Colors.black87,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorText),
    );
  }
}
