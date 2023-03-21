import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final backgroundColor;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton(
      {this.backgroundColor,
      this.textColor,
      required this.buttonText,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
