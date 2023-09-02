import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:electricbillpayment/components/custom_input_field.dart';
import 'package:electricbillpayment/pages/dashboard.dart';
import 'package:electricbillpayment/pages/register.dart';
import 'package:electricbillpayment/services/api.dart';
import 'package:electricbillpayment/styles/button.dart';
import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool rememberMe = false;
  bool hidePassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  var canSubmit = false;
  bool isLoading = false;

  void submitable() {
    setState(() {
      if (emailController.text.isNotEmpty &&
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
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/wave.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: 30,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white54,
                    mini: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 30),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onChanged: (rememberMe) {},
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryButton(),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                  onPressed: canSubmit
                      ? () async {
                          _focusScopeNode.unfocus();

                          processingSubmit();

                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            dialogMessage(
                              'info',
                              'Email and password are required',
                            );

                            return;
                          }

                          var data = {
                            "email": emailController.text,
                            "password": passwordController.text
                          };

                          final response = await Api.login(data);

                          if (response['type'] == 'success') {
                            goToDashboard({'token': response['token']});
                          }

                          dialogMessage(
                            response['type'],
                            response['message'],
                          );

                          processedSubmit();
                        }
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
