import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; 
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lol_app/models/item_master.dart';

void main() {
  // Ensure binding so that rootBundle can load assets during tests.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Load assets/item.json and parse ItemMaster with basic structure checks', () async {
    // Load bundled item master JSON from assets.
    final jsonStr = await rootBundle.loadString('assets/item.json');
    expect(jsonStr, isNotEmpty, reason: 'assets/item.json should be loadable');

    // Decode and parse into model.
    final root = json.decode(jsonStr) as Map<String, dynamic>;
    final master = ItemMaster.fromJson(root);

    // Basic structure checks (no need to check for specific items).
    expect(master.type, isA<String>());
    expect(master.version, isA<String>());
    expect(master.data, isA<Map<int, ItemData>>());
    expect(master.data, isNotEmpty, reason: 'Item catalog should contain entries');

    // Check a sample entry has expected field types only (not specific values).
    final firstItem = master.data.values.first;
    expect(firstItem.name, isA<String>());
    expect(firstItem.description, isA<String>());
    expect(firstItem.gold.total, isA<int>());
    expect(firstItem.image.full, isA<String>());
  });
}
