import 'package:flutter/material.dart';

class _RgbaColor extends Color {
  _RgbaColor(int r, int g, int b, double a): super.fromRGBO(r, g, b, a);
}

/// eg:
/// ```
/// rgba(0, 0, 0, 1);
/// ```
rgba(int r, int g, int b, double a) {
  return _RgbaColor(r,g,b,a);
}