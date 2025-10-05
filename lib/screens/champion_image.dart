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
    this.size = 40.0,
  });

  final Player player;
  final double size;

  /// Derive something like `Briar` from `game_character_displayname_Briar`.
  /// or `Character_Seraphine_Name`.
  static String _deriveChampionBaseName(Player p) {
    // Prefer rawChampionName because championName may be localized.
    String name = p.rawChampionName.trim();
    name = name.removePrefix("game_character_displayname_");
    name = name.removePrefix("Character_");
    name = name.removeSuffix("_Name");

    // Keep existing casing (assets seem to use proper casing already,
    // e.g., DrMundo, Khazix).
    // As a tiny normalization, ensure the first character is uppercase.
    return name.toFirstUppercase();
  }

  @override
  Widget build(BuildContext context) {
    final baseName = _deriveChampionBaseName(player);
    final assetPath = "assets/champion/${baseName}.png";
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: BoxFit.fill,
      filterQuality: FilterQuality.medium,
      errorBuilder: (context, error, stackTrace) {
        return _Placeholder(size: size);
      },
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.size});

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

extension StringExtension on String {
  String removePrefix(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length);
    }
    return this;
  }

  String removeSuffix(String suffix) {
    if (endsWith(suffix)) {
      return substring(0, length - suffix.length);
    }
    return this;
  }

  String toFirstUppercase() {
    return this[0].toUpperCase() + (length > 1 ? substring(1) : "");
  }
}
