/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/house_image1.png
  AssetGenImage get houseImage1 =>
      const AssetGenImage('assets/images/house_image1.png');

  /// File path: assets/images/house_image2.png
  AssetGenImage get houseImage2 =>
      const AssetGenImage('assets/images/house_image2.png');

  /// File path: assets/images/house_image3.png
  AssetGenImage get houseImage3 =>
      const AssetGenImage('assets/images/house_image3.png');

  /// File path: assets/images/images.png
  AssetGenImage get images => const AssetGenImage('assets/images/images.png');

  /// File path: assets/images/messageIcon.png
  AssetGenImage get messageIcon =>
      const AssetGenImage('assets/images/messageIcon.png');

  /// File path: assets/images/onboarding_image2.png
  AssetGenImage get onboardingImage2 =>
      const AssetGenImage('assets/images/onboarding_image2.png');

  /// File path: assets/images/onboarding_image3.png
  AssetGenImage get onboardingImage3 =>
      const AssetGenImage('assets/images/onboarding_image3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        houseImage1,
        houseImage2,
        houseImage3,
        images,
        messageIcon,
        onboardingImage2,
        onboardingImage3
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/TERRA LOGO - MAIN-2 1@2x.svg
  String get tERRALOGOMAIN212x => 'assets/svg/TERRA LOGO - MAIN-2 1@2x.svg';

  /// File path: assets/svg/person.svg
  String get person => 'assets/svg/person.svg';

  /// File path: assets/svg/terra_logo.svg
  String get terraLogo => 'assets/svg/terra_logo.svg';

  /// List of all assets
  List<String> get values => [tERRALOGOMAIN212x, person, terraLogo];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
