import 'package:flutter/material.dart';
import 'package:loadmore/core/config/colors.dart';



final ButtonStyle backButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: kGreyDart3Color,
  
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white
  ),
);





final ButtonStyle whiteButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kGreyDart2Color,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white
  ),
);