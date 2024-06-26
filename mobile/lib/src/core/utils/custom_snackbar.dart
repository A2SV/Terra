import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';

class CustomSnackBar {
  static errorSnackBar({
    required BuildContext context,
    required String message,
    int duration = 5,
    IconData icon = Icons.error,
    Function()? onTap,
  }) {
    dismissAllToast();
    return showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 6),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: context.colorScheme.error,
    );
  }

  static successSnackBar({
    required BuildContext context,
    required String message,
    int duration = 5,
    IconData icon = Icons.check_circle,
    Function()? onTap,
  }) {
    dismissAllToast();
    return showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 5),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: context.colorScheme.primary,
    );
  }

  static warningSnackBar({
    required BuildContext context,
    required String message,
    int duration = 4,
    IconData icon = Icons.check_circle,
    Function()? onTap,
  }) {
    dismissAllToast();
    return showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 5),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: context.colorScheme.secondary,
    );
  }
}
