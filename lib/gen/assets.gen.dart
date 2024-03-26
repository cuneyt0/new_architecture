/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibEnvironmentsGen get environments => const $LibEnvironmentsGen();
}

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dev_logo.png
  AssetGenImage get devLogo =>
      const AssetGenImage('assets/images/dev_logo.png');

  /// File path: assets/images/prod_logo.png
  AssetGenImage get prodLogo =>
      const AssetGenImage('assets/images/prod_logo.png');

  /// File path: assets/images/staging_logo.png
  AssetGenImage get stagingLogo =>
      const AssetGenImage('assets/images/staging_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [devLogo, prodLogo, stagingLogo];
}

class $AssetsLocalizableGen {
  const $AssetsLocalizableGen();

  /// File path: assets/localizable/en.json
  String get en => 'assets/localizable/en.json';

  /// File path: assets/localizable/tr.json
  String get tr => 'assets/localizable/tr.json';

  /// List of all assets
  List<String> get values => [en, tr];
}

class $LibEnvironmentsGen {
  const $LibEnvironmentsGen();

  /// File path: lib/environments/.env.development
  String get envDevelopment => 'lib/environments/.env.development';

  /// File path: lib/environments/.env.production
  String get envProduction => 'lib/environments/.env.production';

  /// File path: lib/environments/.env.staging
  String get envStaging => 'lib/environments/.env.staging';

  /// List of all assets
  List<String> get values => [envDevelopment, envProduction, envStaging];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalizableGen localizable = $AssetsLocalizableGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
