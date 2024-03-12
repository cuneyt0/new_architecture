import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  double screenWidht([double? width]) =>
      MediaQuery.sizeOf(this).width * (width ?? 1);
  double screenHeight([double? height]) =>
      MediaQuery.sizeOf(this).height * (height ?? 1);
}

//Padding
extension GlobalPaddingExtension on BuildContext {
  EdgeInsetsGeometry get globalHorizontal4x =>
      const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsetsGeometry get globalHorizontal8x =>
      const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsetsGeometry get globalHorizontal16x =>
      const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsetsGeometry get globalHorizontal24x =>
      const EdgeInsets.symmetric(horizontal: 24);
  EdgeInsetsGeometry get globalHorizontal32x =>
      const EdgeInsets.symmetric(horizontal: 32);
  EdgeInsetsGeometry get globalVerticall4x =>
      const EdgeInsets.symmetric(vertical: 4);
  EdgeInsetsGeometry get globalVertical8x =>
      const EdgeInsets.symmetric(vertical: 8);
  EdgeInsetsGeometry get globalVertical16x =>
      const EdgeInsets.symmetric(vertical: 16);
  EdgeInsetsGeometry get globalVertical24x =>
      const EdgeInsets.symmetric(vertical: 24);
  EdgeInsetsGeometry get globalVertical32x =>
      const EdgeInsets.symmetric(vertical: 32);
  EdgeInsetsGeometry get globalVertical48x =>
      const EdgeInsets.symmetric(vertical: 48);
  EdgeInsetsGeometry get globalAlll4x => const EdgeInsets.all(4);
  EdgeInsetsGeometry get globalAll8x => const EdgeInsets.all(8);
  EdgeInsetsGeometry get globalAll16x => const EdgeInsets.all(16);
  EdgeInsetsGeometry get globalAll24x => const EdgeInsets.all(24);
  EdgeInsetsGeometry get globalAll32x => const EdgeInsets.all(32);
  EdgeInsetsGeometry get globalSymetricH8V8 =>
      const EdgeInsets.symmetric(horizontal: 8, vertical: 8);
  EdgeInsetsGeometry get globalSymetricH16V16 =>
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  EdgeInsetsGeometry get globalHor32Ver16X =>
      const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
  EdgeInsetsGeometry get globalHor32x =>
      const EdgeInsets.symmetric(horizontal: 32);
  EdgeInsetsGeometry get globalOnlyLeft80x => const EdgeInsets.only(left: 80);
  EdgeInsetsGeometry get globalOnlyLeft80xRight20 =>
      const EdgeInsets.only(left: 80, right: 20);
}
