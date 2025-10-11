import 'package:flutter/material.dart';

class IndicatorIcon extends StatelessWidget {
  const IndicatorIcon({
    super.key,
    required this.ratio,
    required this.size,
  });

  final double ratio;
  final double size;

  bool get blue {
    return ratio > 1.05;
  }

  bool get red {
    return ratio < 0.95;
  }

  @override
  Widget build(BuildContext context) {
    if (ratio > 1.05) {
      return Icon(
        Icons.align_horizontal_left,
        color: Colors.blue,
        size: size,
      );
    } else if (ratio < 0.95) {
      return Icon(
        Icons.align_horizontal_right,
        color: Colors.red,
        size: size,
      );
    }
    return Icon(
      Icons.align_horizontal_center,
      size: size,
      color: Colors.white70,
    );
  }
}
