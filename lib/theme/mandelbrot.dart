import 'dart:ui';
import 'package:flutter/material.dart';

class Mandelbrot {
  static Color homePageBackground = const Color(0xFFfbfcff);
  static Color gradientFirst = const Color(0xff0f17ad);
  static Color gradientSecond = const Color(0xFF6985e8);
  static Color homePageTitle = const Color(0xFF302f51);
  static Color homePageSubtitle = const Color(0xFF414160);
  static Color homePageDetail = const Color(0xFF6588f4);
  static Color homePageIcons = const Color(0xFF3b3c5c);
  static Color homePageContainerTextSmall = const Color(0xFFf4f5fd);
  static Color homePageContainerTextBig = const Color(0xFFffffff);
  static Color homePagePlanColor = const Color(0xFFa2a2b1);
  static Color secondPageTopIconColor = const Color(0xFFb7bce8);
  static Color secondPageTitleColor = const Color(0xFFfefeff);
  static Color secondPageContainerGradient1stColor = const Color(0xFF5564d8);
  static Color secondPageContainerGradient2ndColor = const Color(0xFF6279dc);
  static Color secondPageIconColor = const Color(0xFFfafafe);
  static Color loopColor = const Color(0xFF6d8dea);
  static Color setsColor = const Color(0xFF9999a9);
  static Color circuitsColor = const Color(0xFF2f2f51);

  //QuickLinks
  static const quicklinksHovercolor = const Color(0xF0F5FE);
  static const quicklinksSelectedcolor = const Color(0xE5EFFF);

  static const white = Colors.white;
  static const secondary = Color(0xffa6a6a6);
  static const iconGray = Color(0xff767676);
  static const black = Colors.black;
  static const primary = Color(0xff262626);
  static const primaryBg = Color(0xfff5f5fd);
  static const secondaryBg = Color(0xffececf6);
  static const barBg = Color(0xffe3e3ee);

  static Color mediumGrayColor = Color(0xFFC7C7CC);
  static Color itemPressedColor = Color(0xFFD9D9D9);
  static Color borderColor = Color(0xFFBCBBC1);
  static Color borderLightColor = Color.fromRGBO(49, 44, 51, 1);
  static Color backgroundGray = Color(0xFFEFEFF4);
  static Color groupSubtitle = Color(0xFF777777);
  static Color iosTileDarkColor = Color.fromRGBO(28, 28, 30, 1);
  static Color iosPressedTileColorDark = Color.fromRGBO(44, 44, 46, 1);
  static Color iosPressedTileColorLight = Color.fromRGBO(230, 229, 235, 1);
}

/**
 * 
 * 
 */
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
