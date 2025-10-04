import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' show IOClient;

final _httpClient = _insecureHttpClient();

// 127.0.0.1 への接続時のみ証明書検証をスキップ
http.Client _insecureHttpClient() {
  final client = HttpClient();
  client.badCertificateCallback = (_, __, ___) => true;

  // http.IOClient にラップして http.Client として使う
  return IOClient(client);
}

/// A thin client to access Riot's Live Client Data API exposed by the League
/// client while a game is running.
///
/// Note:
/// - The Live Client Data API is served by the local League client at
///   http://127.0.0.1:2999
/// - No authentication is required for these endpoints.
/// GET /liveclientdata/allgamedata
Future<Map<String, dynamic>> getAllGameData() async {
  final uri = Uri(
    scheme: "https",
    host: "127.0.0.1",
    port: 2999,
    path: "liveclientdata/allgamedata",
  );

  final res = await _httpClient.get(uri);
  _checkOk(res);
  return _asMap(res.body);
}

void _checkOk(http.Response res) {
  if (res.statusCode < 200 || res.statusCode >= 300) {
    throw StateError("HTTP ${res.statusCode}: ${res.reasonPhrase}");
  }
}

Map<String, dynamic> _asMap(dynamic data) {
  if (data is Map<String, dynamic>) {
    return data;
  }
  if (data is Map) {
    return data.map((k, v) => MapEntry(k.toString(), v));
  }
  if (data is String) {
    return json.decode(data) as Map<String, dynamic>;
  }
  throw StateError("Unexpected response type: ${data.runtimeType}");
}
