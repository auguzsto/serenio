import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.labelSize,
    this.myController,
  });

  final IconData icon;
  final String label;
  final double labelSize;
  TextEditingController? myController = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: "(##) # ####-####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: widget.myController,
      inputFormatters: [
        phoneFormatter,
      ],
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: TextStyle(fontSize: widget.labelSize),
        ),
        prefixIcon: Icon(widget.icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
