import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient gradient;
  final double borderRadius;
  final double height;
  final double width;
  final bool isEnabled;
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFF6B027), Color(0xFFB27600)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    this.borderRadius = 8,
    this.height = 48,
    this.width = 140,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: isEnabled ? gradient : null,
        borderRadius: BorderRadius.circular(borderRadius),
        border: isEnabled ? null : Border.all(color: Colors.grey),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
