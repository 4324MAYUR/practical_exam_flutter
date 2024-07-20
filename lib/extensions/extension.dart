import 'package:flutter/material.dart';

extension Mysize on int {
  SizedBox toH() => SizedBox(
        height: toDouble(),
      );
  SizedBox toW() => SizedBox(
        width: toDouble(),
      );
}

extension Stringval on String {
  String get touper => replaceFirst(this[0], this[0].toUpperCase());
}
