class Item {
  const Item({
    required this.canUse,
    required this.consumable,
    required this.count,
    required this.displayName,
    required this.itemID,
    required this.price,
    required this.rawDescription,
    required this.rawDisplayName,
    required this.slot,
  });

  final bool canUse;
  final bool consumable;
  final int count;
  final String displayName;
  final int itemID;
  final int price;
  final String rawDescription;
  final String rawDisplayName;
  final int slot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        canUse: (json['canUse'] as bool? ?? false),
        consumable: (json['consumable'] as bool? ?? false),
        count: (json['count'] as num? ?? 0).toInt(),
        displayName: (json['displayName'] as String?) ?? '',
        itemID: (json['itemID'] as num?)?.toInt() ?? 0,
        price: (json['price'] as num?)?.toInt() ?? 0,
        rawDescription: (json['rawDescription'] as String?) ?? '',
        rawDisplayName: (json['rawDisplayName'] as String?) ?? '',
        slot: (json['slot'] as num? ?? 0).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'canUse': canUse,
        'consumable': consumable,
        'count': count,
        'displayName': displayName,
        'itemID': itemID,
        'price': price,
        'rawDescription': rawDescription,
        'rawDisplayName': rawDisplayName,
        'slot': slot,
      };
}
