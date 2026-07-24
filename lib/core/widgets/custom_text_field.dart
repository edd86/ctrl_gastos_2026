import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          textCapitalization: textCapitalization,
          maxLines: maxLines,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
