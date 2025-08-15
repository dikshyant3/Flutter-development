import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const CustomButtonWidget({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: buttonColor, 
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1.0
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
