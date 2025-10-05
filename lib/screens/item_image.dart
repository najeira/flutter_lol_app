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
    switch (item.depth) {
      case 3:
        return 24.0;
      case 2:
        return 20.0;
      default:
        return 16.0;
    }
  }

  Color? get borderColor {
    switch (item.depth) {
      case 3:
        return Colors.yellowAccent;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetPath = 'assets/item/${item.image.full}';

    final size = this.size;
    final borderColor = this.borderColor;
    final border = borderColor != null
        ? Border.all(color: borderColor, width: 1.0)
        : null;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          assetPath,
          width: size,
          height: size,
          fit: fit,
          filterQuality: FilterQuality.medium,
          errorBuilder: (context, error, stackTrace) {
            return _DefaultPlaceholder(size: size);
          },
        ),
      ),
    );
  }
}

class _DefaultPlaceholder extends StatelessWidget {
  const _DefaultPlaceholder({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade300,
      child: Icon(
        Icons.inventory_2_outlined,
        size: size * 0.6,
        color: Colors.grey.shade600,
      ),
    );
  }
}
