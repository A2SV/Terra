import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShaderRatingWidget extends StatelessWidget {
  final double rating;

  const ShaderRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: [0, rating / 5, rating / 5],
          colors: const [
            AppCommonColors.logoGold,
            AppCommonColors.logoGold,
            Colors.transparent,
          ],
        ).createShader(rect);
      },
      child: Row(
        children: List.generate(
          5,
          (index) {
            return Icon(
              Icons.star,
              color: AppCommonColors.unshadedStarColor,
              size: 15.sp,
            );
          },
        ),
      ),
    );
  }
}