import 'package:flutter/material.dart';

class TextConfig {
  TextConfig({this.fontSize = 12});

  final double fontSize;

  get defaultSize {
    return fontSize;
  }

  get navigatorLabelStyle {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }
}

class IconConfig {
  IconConfig({this.iconSize = 30});

  final double iconSize;

  get defaultSize {
    return iconSize;
  }

  get defaultColor {
    () => Colors.blue.withOpacity(0.6);
  }
}
