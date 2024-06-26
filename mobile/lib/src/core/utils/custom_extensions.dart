import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension CustomStringExtension on String? {
  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color? color,
    FilterQuality filterQuality = FilterQuality.low,
  }) =>
      Image.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
        color: color,
        filterQuality: filterQuality,
      );
  Widget asSvgImage({
    double? size,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.contain,
    double? leftPadding,
    double? rightPadding,
  }) =>
      SvgPicture.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
        placeholderBuilder: (_) => const SizedBox.shrink(),
      ).leftPadding(leftPadding ?? 0).rightPadding(rightPadding ?? 0);
}

extension CustomWidgetExtensions on Widget {
  Widget align(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );

  Widget allPadding(double spacing) => Padding(
        padding: EdgeInsets.all(spacing),
        child: this,
      );

  Widget bottomPadding(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget centered() => Center(child: this);

  Widget circularClip(
    double radius, {
    Color? color,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) =>
      Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          color: color,
        ),
        clipBehavior: Clip.hardEdge,
        child: this,
      );

  Widget hero({required String tag}) => Hero(
        tag: tag,
        child: this,
      );

  Widget horizontalPadding(double spacing) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: this,
      );

  Widget leftPadding(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget onlyPadding(double top, double bottom, double left, double right) =>
      Padding(
        padding:
            EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
        child: this,
      );

  Widget onPressed({
    required Function()? onTap,
    BorderRadius? radius,
    Color? overlayColor,
    Color? color,
    InteractiveInkFeatureFactory? splashFactory,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashFactory: splashFactory ?? InkSplash.splashFactory,
        splashColor: color,
        child: this,
      );

  Widget onPressedGesture({
    required Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: this,
      );

  Widget rightPadding(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget symmetricPadding(double horizontal, double vertical) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget topPadding(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget verticalPadding(double spacing) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: this,
      );
}

extension CustomExtensions on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  double get height => size.height;
  Size get size => MediaQuery.sizeOf(this);
  TextTheme get textTheme => theme.textTheme;
  ThemeData get theme => Theme.of(this);
  double get width => size.width;
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but the callback has index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}