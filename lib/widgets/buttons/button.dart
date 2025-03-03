import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const ButtonWidget({
    Key? key,
    this.text = "Click Me",
    this.textStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? _defaultOnTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF313131),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            const BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(-2, 4),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  void _defaultOnTap() {
    debugPrint("Button tapped!");
  }
}
