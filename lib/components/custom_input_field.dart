import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController textController;
  final VoidCallback submitable;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.textController,
    required this.submitable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: textController,
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
        onChanged: (e) => submitable(),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final bool hidePassword;
  final TextEditingController passwordController;
  final VoidCallback submitable;
  final VoidCallback changeVisiblity;

  const CustomPasswordField({
    super.key,
    required this.hidePassword,
    required this.passwordController,
    required this.submitable,
    required this.changeVisiblity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: passwordController,
        obscureText: hidePassword,
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
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: changeVisiblity,
          ),
        ),
        onChanged: (e) => submitable(),
      ),
    );
  }
}
