import 'package:flutter/material.dart';

Widget CustomIconButton(String imagePath, {VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset(imagePath),
    ),
  );
}
