import 'package:flutter/material.dart';
import 'package:serenio/src/services/utils_service.dart';
import 'dart:math';

class CreditsCustom extends StatelessWidget {
  CreditsCustom({
    super.key,
    this.action,
    required this.string,
  });

  UtilsService utilsService = UtilsService();
  VoidCallback? action;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.green.shade900,
      ),
    );
  }
}
