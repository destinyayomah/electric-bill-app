import 'package:electricbillpayment/components/custom_input_field.dart';
import 'package:electricbillpayment/components/icon_button.dart';
import 'package:electricbillpayment/pages/login.dart';
import 'package:electricbillpayment/styles/button.dart';
import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              mini: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Login to your account',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 30),
          const CustomTextField(
            icon: Icons.person,
            hintText: 'Enter Full Name',
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            icon: Icons.email,
            hintText: 'Enter Email',
          ),
          const SizedBox(height: 15),
          const CustomPasswordField(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: primaryButton(),
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or continue with'),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  'assets/images/facebook.png',
                  onPressed: () {
                    // Facebook button onPressed logic
                  },
                ),
                CustomIconButton(
                  'assets/images/google.png',
                  onPressed: () {
                    // Google button onPressed logic
                  },
                ),
                CustomIconButton(
                  'assets/images/apple.png',
                  onPressed: () {
                    // Apple button onPressed logic
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
