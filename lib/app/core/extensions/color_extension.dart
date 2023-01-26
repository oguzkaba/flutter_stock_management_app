import 'package:flutter/material.dart';

extension ColorEx on String {
  Color get toColor => Color(int.parse('0xff$this'));
}
