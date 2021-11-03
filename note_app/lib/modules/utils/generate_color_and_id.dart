import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// abstract class for generate color and id
abstract class Generate {
  /// data random colors
  static var colors = [
    Color(0xFFFFAB91),
    Color(0xFFFFCC80),
    Color(0xFFE8ED9B),
    Color(0xFFF48FB1),
    Color(0xFFD094DA),
    Color(0xFF82DEEB),
    Color(0xFFEDF6E5),
    Color(0xFFC1AC95),
    Color(0xFF98DDCA),
    Color(0xFFD5ECC2),
    Color(0xFFD6D2C4),
    Color(0xFFFFD3B4),
    Color(0xFFF5C0C0),
    Color(0xFFEBD8B7),
    Color(0xFFC7CFB7),
    Color(0xFFD9E4DD),
    Color(0xFFA3D2CA),
    Color(0xFFFAF0AF),
    Color(0xFFEA907A),
    Color(0xFF7D5A5A),
  ];

  /// get color
  static int generateHexaColor() => Random().nextInt(colors.length);

  /// get id
  static String generateId() => Uuid().v1().toString();
}
