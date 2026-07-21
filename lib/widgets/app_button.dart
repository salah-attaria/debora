import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final double borderRadius;
  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xffFACC15),
    this.foregroundColor = const Color(0xff015254),
    this.height = 55,
    this.borderRadius = 18,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
