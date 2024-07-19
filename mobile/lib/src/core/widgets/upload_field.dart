import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadField extends StatelessWidget {
  final void Function()? onTap;
  const UploadField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [5],
        radius: const Radius.circular(7),
        color: AppCommonColors.textFieldTextColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.file_upload_outlined,
                weight: 0.1,
              ),
              SizedBox(width: 3.w),
              Text(
                'Upload property pictures',
                style: context.textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppCommonColors.textFieldTextColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
