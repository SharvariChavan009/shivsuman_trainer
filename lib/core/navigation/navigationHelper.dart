// navigation_helper.dart
import 'package:flutter/material.dart';

class NavigationHelper {
  // Navigate to a new screen
  static Future<T?> navigateTo<T extends Object?>(BuildContext context, Widget destination) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  // Replace the current screen with a new one
  static Future<T?> navigateAndReplace<T extends Object?, TO extends Object?>(
      BuildContext context, Widget destination) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  // Navigate to a new screen and remove all the previous screens
  static Future<T?> navigateAndRemoveUntil<T extends Object?>(
      BuildContext context, Widget destination) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destination),
      (Route<dynamic> route) => false,
    );
  }

  // Pop the current screen
  static void goBack(BuildContext context, [Object? result]) {
    Navigator.pop(context, result);
  }
}



// NavigationHelper.navigateTo(context, SecondScreen());
// NavigationHelper.goBack(context);