import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:electricbillpayment/services/api.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final Map token;

  const Dashboard({super.key, required this.token});

  @override
  State<Dashboard> createState() => _DashboardState();
}

void dialogMessage(context, type, message) {
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

class _DashboardState extends State<Dashboard> {
  dynamic userData;

  Future<void> fetchUser() async {
    try {
      final jwt = JWT.verify(
        widget.token['token'],
        SecretKey('ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'),
      );

      final String id = jwt.payload['id'];
      final data = {'id': id, 'token': widget.token['token']};
      final response = await Api.getAUser(data);
      setState(() {
        userData = response;
      });
    } on JWTExpiredException {
      dialogMessage(context, 'info', 'logged out');
    } on JWTException catch (ex) {
      dialogMessage(context, 'error', ex.message);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: userData != null ? Text(userData['fullname']) : Text('No data'),
      ),
    );
  }
}
