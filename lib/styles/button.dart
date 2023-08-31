import 'package:electricbillpayment/styles/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle whiteishButton(Color color) => ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );

ButtonStyle transparentButton() => ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );

ButtonStyle primaryButton() => ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
