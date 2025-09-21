import 'package:flutter/material.dart';
import 'package:loadmore/core/config/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onPressed,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        cursorColor: kGreyLight2Color,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: Colors.white70, size: 20)
                  : null,
          suffixIcon:
              suffixIcon != null
                  ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(suffixIcon, color: Colors.white70, size: 20),
                  )
                  : null,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontSize: 12,
            height: 0.8,
          ),
          errorMaxLines: 1,
        ),
      ),
    );
  }
}
