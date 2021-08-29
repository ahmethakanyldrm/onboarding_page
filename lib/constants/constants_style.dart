import 'package:flutter/material.dart';
import 'package:onboarding_page/constants/constants_color.dart';

class ConstantsStyle {
  static var skipStyle = TextStyle(
    color: ConstantColor.primary,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static var makePageTitle = TextStyle(
    color: ConstantColor.secondary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static var makePageContent = TextStyle(
    color: ConstantColor.gray,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static var splashStyle = TextStyle(
    color: ConstantColor.gray,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
