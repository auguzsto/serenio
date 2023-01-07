import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.textSize,
    required this.text,
    this.onPressed,
  });

  final IconData icon;
  final double? iconSize;
  final String text;
  final double? textSize;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(
        icon,
        size: iconSize,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(fontSize: textSize),
      ),
    );
  }
}
