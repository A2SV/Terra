import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatefulWidget {
  final bool? disabled;
  final bool? showSuffixWidget;
  final bool? showPrefixWidget;
  final Color? backgroundColor;
  final Color? borderColor;

  final Color? textColor;
  final double? borderRadius;
  final double? height;
  final double? horizontalPadding;
  final double? width;
  final Function() onPressed;
  final OutlinedBorder? shape;
  final String text;
  final TextStyle? textStyle;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool gradient;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
    this.shape,
    this.horizontalPadding,
    this.suffixWidget,
    this.prefixWidget,
    this.showSuffixWidget,
    this.showPrefixWidget,
    this.disabled,
    this.borderColor,
    this.textColor,
    this.gradient = true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.disabled==true? Colors.grey:widget.backgroundColor ?? AppCommonColors.mainBlueButton,
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 14.0,
            ),
          ),
          width: widget.width ?? context.width,
          height: widget.height ?? 60,
          child: TextButton(
            onPressed: widget.disabled == true ? null : widget.onPressed,
            style: TextButton.styleFrom(
              shape: widget.shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 10,
                    ),
                    side: BorderSide(
                      color: widget.disabled==true?Colors.grey:widget.borderColor ?? AppCommonColors.activeButton,
                    ),
                  ),
              padding: EdgeInsets.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.showPrefixWidget == true &&
                    widget.prefixWidget != null)
                  widget.prefixWidget!,
                Text(
                  widget.text,
                  style: widget.textStyle ??
                      context.textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        color:
                            widget.textColor ?? context.colorScheme.onPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                if (widget.showSuffixWidget == true &&
                    widget.suffixWidget != null)
                  widget.suffixWidget!,
              ],
            ),
          ),
        ).horizontalPadding(widget.horizontalPadding ?? 30),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
  }
}
