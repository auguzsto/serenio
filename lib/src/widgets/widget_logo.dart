import 'package:flutter/material.dart';

class WidgetLogo extends StatelessWidget {
  const WidgetLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        //border: Border.all(),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: const [
          Icon(
            Icons.attach_money,
            color: Colors.green,
            size: 150,
          ),
          Positioned(
            left: 110,
            child: Text(
              "erênio",
              style: TextStyle(fontSize: 28, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
