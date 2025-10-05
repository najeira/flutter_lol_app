import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item_master.dart';

final itemMasterProvider = FutureProvider<ItemMaster>((ref) async {
  final data = await loadItemMaster();
  return data;
});

final itemMasterValueProvider = Provider.autoDispose<ItemMaster?>((ref) {
  return ref.watch(itemMasterProvider.select((data) => data.valueOrNull));
});
