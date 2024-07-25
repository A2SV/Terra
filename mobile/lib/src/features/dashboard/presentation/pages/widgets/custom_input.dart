import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? hint;
  final Icon? icon;
  final int? maxLines;
  const CustomInput({super.key, required this.label, this.hint, this.icon, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
        style:const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400
        ),),
        SizedBox(height:1.h),
        SizedBox(
          height: 10.h,
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              
              prefixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hint,
            ),
          ),
        )

      ],

    );
  }
}
