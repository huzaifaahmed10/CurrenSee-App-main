import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const HeadingWidget({
    super.key, // Using super parameter
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
