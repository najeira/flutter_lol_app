import 'package:flutter/material.dart';

import '../models/player.dart';

/// A widget that displays a champion image based on [Player] data.
///
/// It determines the asset image file name from [Player.rawChampionName]
/// (e.g., `game_character_displayname_Briar` -> `Briar`) and loads
/// `assets/champion/<Name>.png`.
///
/// If the asset is missing, it shows a simple placeholder.
class ChampionImage extends StatelessWidget {
  const ChampionImage({
    super.key,
    required this.player,
    this.size = 48,
    this.fit = BoxFit.cover,
    this.borderRadius = 8,
    this.placeholder,
    this.backgroundColor,
  });

  final Player player;
  final double size;
  final BoxFit fit;
  final double borderRadius;
  final Widget? placeholder;
  final Color? backgroundColor;

  /// Derive something like `Briar` from `game_character_displayname_Briar`.
  static String _deriveChampionBaseName(Player p) {
    // Prefer rawChampionName because championName may be localized.
    String name = p.rawChampionName.trim();

    const prefix = "game_character_displayname_";
    if (name.startsWith(prefix)) {
      name = name.substring(prefix.length);
    }

    // Keep existing casing (assets seem to use proper casing already, e.g., DrMundo, Khazix).
    // As a tiny normalization, ensure the first character is uppercase.
    name = name[0].toUpperCase() + (name.length > 1 ? name.substring(1) : "");
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final baseName = _deriveChampionBaseName(player);
    final assetPath = "assets/champion/${baseName}.png";
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        color: backgroundColor ?? Colors.black12,
        child: Image.asset(
          assetPath,
          width: size,
          height: size,
          fit: fit,
          filterQuality: FilterQuality.medium,
          errorBuilder: (context, error, stackTrace) {
            return placeholder ?? _DefaultPlaceholder(size: size);
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
        Icons.help_outline,
        size: size * 0.6,
        color: Colors.grey.shade600,
      ),
    );
  }
}
