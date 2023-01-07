import 'package:flutter/material.dart';

class AuthController {
  SnackBar snackBarAlert(context, size) {
    return SnackBar(
      padding: const EdgeInsets.all(21),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(31),
        ),
      ),
      elevation: 10.0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: size / 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ops...",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "O campo celular deve ser válido.",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  bool validedFieldPhone(String phoneNumber) {
    return phoneNumber.length >= 16 || phoneNumber.isNotEmpty ? true : false;
  }
}
