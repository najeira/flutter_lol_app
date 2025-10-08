import '../utils/json.dart';

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
    canUse: asBool(json['canUse']),
    consumable: asBool(json['consumable']),
    count: asInt(json['count']),
    displayName: asString(json['displayName']),
    itemID: asInt(json['itemID']),
    price: asInt(json['price']),
    rawDescription: asString(json['rawDescription']),
    rawDisplayName: asString(json['rawDisplayName']),
    slot: asInt(json['slot']),
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
