import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:electricbillpayment/components/custom_input_field.dart';
import 'package:electricbillpayment/components/icon_button.dart';
import 'package:electricbillpayment/pages/dashboard.dart';
import 'package:electricbillpayment/services/api.dart';
import 'package:electricbillpayment/styles/button.dart';
import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hidePassword = true;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  bool canSubmit = false;
  bool isLoading = false;

  void submitable() {
    setState(() {
      if (fullnameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        canSubmit = true;
      } else {
        canSubmit = false;
      }
    });
  }

  void changeVisiblity() {
    setState(() {
      if (hidePassword) {
        hidePassword = false;
      } else {
        hidePassword = true;
      }
    });
  }

  void processingSubmit() {
    setState(() {
      canSubmit = false;
      isLoading = true;
    });
  }

  void processedSubmit() {
    setState(() {
      canSubmit = true;
      isLoading = false;
    });
  }

  void dialogMessage(type, message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          icon: Icon(
            type == 'success'
                ? Icons.check_circle
                : Icons.notification_important_sharp,
            color: type == 'success' ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }

  void goToDashboard(token) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Dashboard(token: token),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            FocusScope(
              node: _focusScopeNode,
              child: CustomTextField(
                icon: Icons.person,
                hintText: 'Enter Full Name',
                textController: fullnameController,
                submitable: submitable,
              ),
            ),
            const SizedBox(height: 15),
            FocusScope(
              node: _focusScopeNode,
              child: CustomTextField(
                icon: Icons.email,
                hintText: 'Enter Email',
                textController: emailController,
                submitable: submitable,
              ),
            ),
            const SizedBox(height: 15),
            FocusScope(
              node: _focusScopeNode,
              child: CustomPasswordField(
                hidePassword: hidePassword,
                passwordController: passwordController,
                submitable: submitable,
                changeVisiblity: changeVisiblity,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryButton(),
                  onPressed: canSubmit
                      ? () async {
                          // CLOSE KEYBOARD
                          _focusScopeNode.unfocus();

                          processingSubmit();

                          if (passwordController.text.isNotEmpty) {
                            var data = {
                              "fullname": fullnameController.text,
                              "email": emailController.text,
                              "password": passwordController.text
                            };

                            final response = await Api.register(data);

                            if (response['type'] == 'success') {
                              goToDashboard({'token': response['token']});
                            }

                            dialogMessage(
                              response['type'],
                              response['message'],
                            );

                            processedSubmit();
                          }
                        }
                      : null,
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
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
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
