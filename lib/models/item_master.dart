import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// LoL item master data model (parsed from assets/item.json).
///
/// This is independent from the live client "AllGameData" models and only
/// represents the static item catalog bundled in the app.
class ItemMaster {
  const ItemMaster({
    required this.type,
    required this.version,
    required this.data,
  });

  /// Typically "item".
  final String type;

  /// Data Dragon version string (e.g. "15.1.1").
  final String version;

  /// Map of item ID to its definition.
  final Map<int, ItemData> data;

  factory ItemMaster.fromJson(Map<String, dynamic> json) {
    final rawData = (json['data'] as Map<String, dynamic>? ?? <String, dynamic>{});
    final parsed = <int, ItemData>{};
    for (final entry in rawData.entries) {
      final id = int.tryParse(entry.key);
      if (id != null && entry.value is Map<String, dynamic>) {
        parsed[id] = ItemData.fromJson(entry.value as Map<String, dynamic>);
      }
    }
    return ItemMaster(
      type: (json['type'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
      data: parsed,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'version': version,
        'data': data.map((k, v) => MapEntry(k.toString(), v.toJson())),
      };

  /// Returns item by numeric ID if exists.
  ItemData? operator [](int id) => data[id];
}

class ItemData {
  const ItemData({
    required this.name,
    required this.description,
    required this.plaintext,
    required this.colloq,
    required this.into,
    required this.from,
    required this.gold,
    required this.tags,
    required this.maps,
    required this.stats,
    this.depth = 0,
    this.stacks = 0,
    this.consumed = false,
    this.inStore = true,
    this.hideFromAll = false,
    this.requiredAlly = '',
    this.requiredChampion = '',
    this.specialRecipe = 0,
    required this.image,
  });

  final String name;
  final String description;
  final String plaintext;
  final String colloq;
  final List<int> into; // item IDs this upgrades into
  final List<int> from; // component item IDs
  final ItemGold gold;
  final List<String> tags;
  final Map<String, bool> maps;
  final Map<String, num> stats;

  final int depth;
  final int stacks;
  final bool consumed;
  final bool inStore;
  final bool hideFromAll;
  final String requiredAlly;
  final String requiredChampion;
  final int specialRecipe;
  final ItemImage image;

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        name: (json['name'] as String?) ?? '',
        description: (json['description'] as String?) ?? '',
        plaintext: (json['plaintext'] as String?) ?? '',
        colloq: (json['colloq'] as String?) ?? '',
        into: _asIdList(json['into']),
        from: _asIdList(json['from']),
        gold: ItemGold.fromJson(json['gold'] as Map<String, dynamic>? ?? const {}),
        tags: (json['tags'] as List?)?.whereType<String>().toList() ?? const <String>[],
        maps: _asBoolMap(json['maps']),
        stats: _asNumMap(json['stats']),
        depth: (json['depth'] as num?)?.toInt() ?? 0,
        stacks: (json['stacks'] as num?)?.toInt() ?? 0,
        consumed: (json['consumed'] as bool?) ?? false,
        inStore: (json['inStore'] as bool?) ?? true,
        hideFromAll: (json['hideFromAll'] as bool?) ?? false,
        requiredAlly: (json['requiredAlly'] as String?) ?? '',
        requiredChampion: (json['requiredChampion'] as String?) ?? '',
        specialRecipe: (json['specialRecipe'] as num?)?.toInt() ?? 0,
        image: ItemImage.fromJson(json['image'] as Map<String, dynamic>? ?? const {}),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'plaintext': plaintext,
        'colloq': colloq,
        'into': into.map((e) => e.toString()).toList(),
        'from': from.map((e) => e.toString()).toList(),
        'gold': gold.toJson(),
        'tags': tags,
        'maps': maps,
        'stats': stats,
        'depth': depth,
        'stacks': stacks,
        'consumed': consumed,
        'inStore': inStore,
        'hideFromAll': hideFromAll,
        'requiredAlly': requiredAlly,
        'requiredChampion': requiredChampion,
        'specialRecipe': specialRecipe,
        'image': image.toJson(),
      };

  static List<int> _asIdList(dynamic v) {
    if (v is List) {
      return v
          .map((e) => e is num ? e.toInt() : (e is String ? int.tryParse(e) : null))
          .whereType<int>()
          .toList();
    }
    return const <int>[];
  }

  static Map<String, bool> _asBoolMap(dynamic v) {
    if (v is Map) {
      return v.map<String, bool>((key, value) => MapEntry('$key', value == true));
    }
    return const <String, bool>{};
  }

  static Map<String, num> _asNumMap(dynamic v) {
    if (v is Map) {
      final map = <String, num>{};
      v.forEach((key, value) {
        if (value is num) map['$key'] = value;
      });
      return map;
    }
    return const <String, num>{};
  }
}

class ItemGold {
  const ItemGold({
    required this.base,
    required this.total,
    required this.sell,
    required this.purchasable,
  });

  final int base;
  final int total;
  final int sell;
  final bool purchasable;

  factory ItemGold.fromJson(Map<String, dynamic> json) => ItemGold(
        base: (json['base'] as num?)?.toInt() ?? 0,
        total: (json['total'] as num?)?.toInt() ?? 0,
        sell: (json['sell'] as num?)?.toInt() ?? 0,
        purchasable: (json['purchasable'] as bool?) ?? false,
      );

  Map<String, dynamic> toJson() => {
        'base': base,
        'total': total,
        'sell': sell,
        'purchasable': purchasable,
      };
}

class ItemImage {
  const ItemImage({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  factory ItemImage.fromJson(Map<String, dynamic> json) => ItemImage(
        full: (json['full'] as String?) ?? '',
        sprite: (json['sprite'] as String?) ?? '',
        group: (json['group'] as String?) ?? '',
        x: (json['x'] as num?)?.toInt() ?? 0,
        y: (json['y'] as num?)?.toInt() ?? 0,
        w: (json['w'] as num?)?.toInt() ?? 0,
        h: (json['h'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'full': full,
        'sprite': sprite,
        'group': group,
        'x': x,
        'y': y,
        'w': w,
        'h': h,
      };
}

/// Load item master data from bundled asset (assets/item.json).
Future<ItemMaster> loadItemMaster({String assetPath = 'assets/item.json'}) async {
  final jsonStr = await rootBundle.loadString(assetPath);
  final root = json.decode(jsonStr) as Map<String, dynamic>;
  return ItemMaster.fromJson(root);
}
