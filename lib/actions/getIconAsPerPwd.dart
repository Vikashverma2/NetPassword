import 'package:flutter/material.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

String getIconPathForPasswordStrength(String strength) {
  switch (strength) {
    case 'Very Weak':
      return IconsAssets.passwordOpen; // Replace with actual paths
    case 'Weak':
      return IconsAssets.passwordCross;
    case 'Moderate':
      return IconsAssets.lock;
    case 'Strong':
      return IconsAssets.passwordTick;
    case 'Very Strong':
      return IconsAssets.madel;
    default:
      return IconsAssets.passwordSield;
  }
}

Color getColorForPasswordStrength(String strength) {
  switch (strength) {
    case 'Very Weak':
      return Colors.red;
    case 'Weak':
      return Colors.orange;
    case 'Moderate':
      return Colors.yellow;
    case 'Strong':
      return Colors.lightGreen;
    case 'Very Strong':
      return Colors.green;
    default:
      return Colors.grey; // Default color for unexpected input
  }
}
