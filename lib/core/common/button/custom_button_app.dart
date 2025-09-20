import 'package:flutter/material.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({
    super.key,
    required this.onPress,
    required this.child,
    this.backgroundColor = const Color(0xFF333333),
    this.radius = 8,
    this.height = 48,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.gradient,
  });
  final VoidCallback onPress;
  final Widget child;
  final Color backgroundColor;
  final double radius;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: child,
      ),
    );
  }
}
