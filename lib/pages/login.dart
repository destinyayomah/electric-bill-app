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

  // HIDE AND SHOW CREATE BUTTON IF ALL FIELDS ARE FILLED
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

  // HIDE AND SHOW PASSWORD FIELD AND VISIBILITY ICON
  void changeVisiblity() {
    setState(() {
      if (hidePassword) {
        hidePassword = false;
      } else {
        hidePassword = true;
      }
    });
  }

  // CHANGE BUTTON STATE TO LOADING WITH SPINNER
  void processingSubmit() {
    setState(() {
      canSubmit = false;
      isLoading = true;
    });
  }

  // REMOVE BUTTON STATE FROM LOADING AND SPINNER
  void processedSubmit() {
    setState(() {
      canSubmit = true;
      isLoading = false;
    });
  }

  // GENERIC NOTIFICATION POPUP WITH BACKDROP
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

  // NAVIGATION TO DASHBOARD WITH TOKEN
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
            // TOP WAVE IMAGE SECTION
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
            // EMAIL FIELD
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
            // PASSWORD FIELD
            FocusScope(
              node: _focusScopeNode,
              child: CustomPasswordField(
                hidePassword: hidePassword,
                passwordController: passwordController,
                submitable: submitable,
                changeVisiblity: changeVisiblity,
              ),
            ),
            // REMEMBER ME AND FORGOT PASSWORD
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
            // LOGIN BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: primaryButton(),
                  onPressed: canSubmit
                      ? () async {
                          // HIDE KEYBOARD
                          _focusScopeNode.unfocus();

                          // UPDATE LOGIN BUTTON STATE
                          processingSubmit();

                          var data = {
                            "email": emailController.text,
                            "password": passwordController.text
                          };

                          /// CALLING API
                          final response = await Api.login(data);

                          // IF RESPONSE IS SUCCESSFUL, GO TO DASHBOARD
                          if (response['type'] == 'success') {
                            goToDashboard({'token': response['token']});
                          }

                          // IF API CALL IS SUCCESSFUL OR NOT SHOW A CUSTOM MESSAGE
                          dialogMessage(
                            response['type'],
                            response['message'],
                          );

                          // UPDATE BUTTON LOADING STATE
                          processedSubmit();
                        }
                      : null,
                  child: isLoading
                      ? const CircularProgressIndicator(
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
