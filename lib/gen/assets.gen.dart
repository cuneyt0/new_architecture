/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

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
  static const $AssetsLocalizableGen localizable = $AssetsLocalizableGen();
  static const $LibGen lib = $LibGen();
}
