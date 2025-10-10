import 'package:flutter/material.dart';

// A record to hold the font weights for both teams.
typedef TeamFontWeights = ({FontWeight blue, FontWeight red});

/// Calculates the font weights for the app bar based on the team power ratio.
TeamFontWeights calculateAppBarFontWeights(double ratio) {
  if (ratio > 1.15) return (blue: FontWeight.w800, red: FontWeight.w200);
  if (ratio > 1.10) return (blue: FontWeight.w700, red: FontWeight.w300);
  if (ratio > 1.05) return (blue: FontWeight.w600, red: FontWeight.w400);
  if (ratio < 0.85) return (blue: FontWeight.w200, red: FontWeight.w800);
  if (ratio < 0.90) return (blue: FontWeight.w300, red: FontWeight.w700);
  if (ratio < 0.95) return (blue: FontWeight.w400, red: FontWeight.w600);
  return (blue: FontWeight.normal, red: FontWeight.normal);
}

/// Creates the icon for the app bar based on the team power ratio.
Icon createAppbarIcon(double ratio, {double size = 16.0}) {
  if (ratio > 1.05) {
    return Icon(Icons.align_horizontal_left, color: Colors.blue, size: size);
  } else if (ratio < 0.95) {
    return Icon(Icons.align_horizontal_right, color: Colors.red, size: size);
  } else {
    return Icon(Icons.align_horizontal_center, color: Colors.white70, size: size);
  }
}

/// Creates the icon for the player power indicator based on the power difference.
Icon createPlayerIndicatorIcon(double diff, {double size = 14.0}) {
  if (diff > 500) {
    return Icon(
      Icons.align_horizontal_left,
      size: size,
      color: Colors.blue,
    );
  } else if (diff < -500) {
    return Icon(
      Icons.align_horizontal_right,
      size: size,
      color: Colors.red,
    );
  } else {
    return Icon(
      Icons.align_horizontal_center,
      size: size,
      color: Colors.white70,
    );
  }
}