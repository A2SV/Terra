import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final TextFormFieldType textFormFieldType;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool? filled;
  final String? suffixText;
  final BoxConstraints? prefixIconConstraints;
  final double? borderRadiusValue;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double cursorWidth;
  final bool? showCursor;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validate;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Color? borderSideColor;
  final bool autofocus;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String?)? onSaved;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.textFormFieldType,
    required this.hintText,
    this.hintStyle,
    this.errorStyle,
    this.contentPadding,
    this.fillColor,
    this.filled,
    this.suffixText,
    this.prefixIconConstraints,
    this.borderRadiusValue,
    this.suffixIcon,
    this.prefix,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.cursorWidth = 2.0,
    this.showCursor,
    this.inputFormatter,
    this.validate,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.textInputAction,
    this.initialValue,
    this.onTap,
    this.style,
    this.prefixIcon,
    this.borderSideColor,
    this.autofocus = false,
    this.onTapOutside,
    this.onSaved,
    this.maxLines,
  });
  @override
  State<CustomTextFormField> createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  get _cursorHeight => 20.0;
  get _textFieldDecoration => _textFormFieldDecoration();
  get _textFieldHintStyle => context.textTheme.displaySmall;
  get _textFieldTextStyle => context.textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w500,
        // color: AppLightThemeColors.kDarkTextColor,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        switch (widget.textFormFieldType) {
          case TextFormFieldType.regular:
            return _formFormField();

          case TextFormFieldType.multiline:
            return _multiLineFormField();
          case TextFormFieldType.password:
            return _passwordFormField();
          default:
            return _formFormField();
        }
      },
    );
  }

  void hideShowPin() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _formFormField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          cursorWidth: widget.cursorWidth,
          showCursor: widget.showCursor,
          inputFormatters: widget.inputFormatter,
          validator: widget.validate,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          style: widget.style ?? _textFieldTextStyle,
          cursorHeight: _cursorHeight,
          decoration: _textFieldDecoration,
        ),
      ],
    );
  }

  Widget _multiLineFormField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          maxLength: widget.maxLength,
          cursorWidth: widget.cursorWidth,
          showCursor: widget.showCursor,
          inputFormatters: widget.inputFormatter,
          validator: widget.validate,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          autofocus: widget.autofocus,
          style: widget.style ?? _textFieldTextStyle,
          cursorHeight: _cursorHeight,
          decoration: _textFieldDecoration,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTapOutside: widget.onTapOutside,
          onSaved: widget.onSaved,
          maxLines: widget.maxLines ?? 5,
        ),
      ],
    );
  }

  Widget _passwordFormField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.visiblePassword,
          maxLength: widget.maxLength,
          cursorWidth: widget.cursorWidth,
          showCursor: widget.showCursor,
          inputFormatters: widget.inputFormatter,
          validator: widget.validate,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          obscuringCharacter: "*",
          style: widget.style ?? _textFieldTextStyle,
          cursorHeight: _cursorHeight,
          decoration: _textFieldDecoration,
        ),
      ],
    );
  }

  InputDecoration _textFormFieldDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ?? _textFieldHintStyle,
      errorMaxLines: 1,
      errorStyle: widget.errorStyle ??
          context.textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
      contentPadding: widget.contentPadding ??
          EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
      fillColor: widget.fillColor,
      filled: widget.filled ?? true,
      counterText: "",
      prefixIconConstraints: widget.prefixIconConstraints ??
          const BoxConstraints(minWidth: 0, minHeight: 0),
      suffixText: widget.suffixText,
      suffixIconConstraints: const BoxConstraints(maxHeight: 20),
      suffixIcon: widget.suffixIcon ??
          (widget.textFormFieldType == TextFormFieldType.password
              ? _obscureText
                  ? const Icon(Icons.visibility)
                      .onPressed(onTap: hideShowPin)
                      .rightPadding(20)
                  : const Icon(Icons.visibility_off)
                      .onPressed(onTap: hideShowPin)
                      .rightPadding(20)
              : null),
      prefixIcon: widget.prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 14),
        borderSide: BorderSide(
          color: widget.borderSideColor ?? AppCommonColors.fieldBorderColor,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 14),
        borderSide: BorderSide(
          color: widget.borderSideColor ?? AppCommonColors.fieldBorderColor,
        ),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 14),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadiusValue ?? 14),
        gapPadding: 10,
      ),
    );
  }
}

enum TextFormFieldType { regular, multiline, password }
