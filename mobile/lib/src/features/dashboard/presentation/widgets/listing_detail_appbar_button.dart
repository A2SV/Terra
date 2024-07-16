import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListingDetailAppbarButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const ListingDetailAppbarButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      this.iconColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.black,
        size: 17.sp,
      ),
    );
  }
}
