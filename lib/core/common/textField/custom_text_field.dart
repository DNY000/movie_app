import 'package:flutter/material.dart';
import 'package:loadmore/core/config/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onPressed,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF333333),
            borderRadius: BorderRadius.circular(8),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kYellowColor),
              ),

              prefixIcon: Icon(prefixIcon, color: Colors.white70, size: 20),
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
                height: 0.8, // Giữ cho error text không đẩy field quá xa
              ),
              errorMaxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
