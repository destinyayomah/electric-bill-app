import 'package:electricbillpayment/components/home_button.dart';
import 'package:electricbillpayment/pages/login.dart';
import 'package:electricbillpayment/pages/register.dart';
import 'package:electricbillpayment/styles/button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black54,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              child: const Text(
                'Electric Bill',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                ),
              ),
            ),
            HomeButton(
              position: 160,
              style: whiteishButton(Colors.white24),
              text: 'Sign in',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
            ),
            HomeButton(
              position: 100,
              style: transparentButton(),
              text: 'Create an account',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
