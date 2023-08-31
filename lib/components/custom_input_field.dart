import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const CustomTextField(
      {super.key, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: primaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff0094FF), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: const Color.fromARGB(57, 0, 149, 255),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter password',
          hintStyle: TextStyle(color: primaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff0094FF), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: const Color.fromARGB(57, 0, 149, 255),
          filled: true,
          prefixIcon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.remove_red_eye,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
