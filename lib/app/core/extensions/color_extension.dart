import 'package:flutter/material.dart';

/// The `extension ColorEx on String` is creating an extension on the `String` class named `ColorEx`.
/// This allows you to add new functionality to the `String` class specifically for strings that
/// represent colors.
extension ColorEx on String {
  /// toColor getter
  Color get toColor => Color(int.parse('0xff$this'));
}
