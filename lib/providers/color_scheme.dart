import 'package:flutter/material.dart';

class ColorSchemeProvider extends InheritedWidget {
  final ColorScheme colorScheme;
  const ColorSchemeProvider({
    Key? key,
    required this.colorScheme,
    required Widget child,
  }) : super(key: key, child: child);

  static ColorSchemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorSchemeProvider>();
  }

  @override
  bool updateShouldNotify(ColorSchemeProvider oldWidget) {
    return colorScheme != oldWidget.colorScheme;
  }
}
