import 'package:flutter/material.dart';

import '../models/item_master.dart';

/// A widget that displays a LoL item image.
///
/// It loads PNG from assets/item/<itemID>.png.
/// If the asset is missing, it shows a simple placeholder.
class ItemIcon extends StatelessWidget {
  const ItemIcon({
    super.key,
    required this.item,
    this.fit = BoxFit.cover,
    this.borderRadius = 4.0,
  });

  final ItemData item;
  final BoxFit fit;
  final double borderRadius;

  double get size {
    switch (item.rare) {
      case 3:
        return 24.0;
      case 2:
        return 20.0;
      default:
        return 16.0;
    }
  }

  Border? get border {
    switch (item.rare) {
      case 3:
        return Border.all(color: Colors.yellowAccent, width: 1.0);
      case 2:
        return Border.all(color: Colors.white60, width: 0.5);
      default:
        return Border.all(color: Colors.white24, width: 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = this.size;
    final radius = BorderRadius.circular(borderRadius);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Image.asset(
          "assets/item/${item.image.full}",
          width: size,
          height: size,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return _Placeholder(size: size);
          },
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.dangerous_outlined,
        size: size * 0.6,
      ),
    );
  }
}
