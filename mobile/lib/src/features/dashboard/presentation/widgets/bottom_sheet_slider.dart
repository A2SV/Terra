import 'package:flutter/material.dart';

import '../../../../core/theme/common_color.dart';
import '../../../../core/widgets/custom_button.dart';

class BottomSheetSlider extends StatelessWidget {
  final String title;
  final String subtext;
  final String buttonText;
  final String? skipText;
  final String iconPath;
  final VoidCallback getButtonAction;
  final VoidCallback? onSkip;

  const BottomSheetSlider({
    super.key,
    required this.title,
    required this.subtext,
    required this.buttonText,
    required this.iconPath,
    required this.getButtonAction,
    this.onSkip,
    this.skipText,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.5, // Use 50% of screen height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 65,
            height: 4,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(83, 88, 122, 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: height * 0.03),
          // Icon
          Image.asset(
            iconPath,
            width: 100,
            height: 100,
          ),
          SizedBox(height: height * 0.015),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          SizedBox(height: height * 0.025),
          // Subtext
          Text(
            subtext,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(160, 160, 160, 1),
            ),
          ),
          SizedBox(height: height * 0.030),
          // Button
          CustomButton(
            text: buttonText,
            onPressed: getButtonAction,
            backgroundColor: AppCommonColors.mainBlueButton,
            width: 300,
            height: 65,
            borderRadius: 14.0,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            borderColor: Colors.transparent,
            disabled: false,
          ),

          SizedBox(height: height * 0.025),
          // Optional Skip Button
          if (onSkip != null && skipText != null)
            TextButton(
              onPressed: onSkip,
              child: Text(
                skipText!,
                style: const TextStyle(color: Color.fromRGBO(184, 184, 184, 1)),
              ),
            ),
        ],
      ),
    );
  }
}

// Helper function to show the reusable bottom sheet
void showBottomSheetSlider(
  BuildContext context, {
  required String title,
  required String subtext,
  required String buttonText,
  required String iconPath,
  required VoidCallback getButtonAction,
  VoidCallback? onSkip,
  String? skipText,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(0),
      child: BottomSheetSlider(
        title: title,
        subtext: subtext,
        buttonText: buttonText,
        iconPath: iconPath,
        getButtonAction: getButtonAction,
        onSkip: onSkip,
        skipText: skipText,
      ),
    ),
  );
}
