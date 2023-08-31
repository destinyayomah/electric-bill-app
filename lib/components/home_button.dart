import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final double position;
  final ButtonStyle style;
  final String text;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.position,
    required this.style,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: position,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
