import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  final TextInputType keyboardType;
  final bool numbersOnly;
  final bool obscureText;
  final int maxLines;

  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.numbersOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      keyboardType: keyboardType,

      obscureText: obscureText,

      maxLines: maxLines,

      validator: validator,

      inputFormatters: numbersOnly
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,

      decoration: InputDecoration(
            labelText: label,

            labelStyle: const TextStyle(
                color: Color(0xff015254),
            ),

            floatingLabelStyle: const TextStyle(
                color: Color(0xff015254),
                fontWeight: FontWeight.w600,
            ),

            prefixIcon: Icon(
                icon,
                color: const Color(0xff015254),
            ),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                color: Colors.grey.shade300,
                ),
            ),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                color: Color(0xffFACC15),
                width: 2,
                ),
            ),

            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                color: Colors.red,
                ),
            ),

            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
                ),
            ),
        ),
    );
  }
}