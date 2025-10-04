import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

/// A thin wrapper around the OpenAPI-generated client to access Riot's
/// Live Client Data API exposed by the League client while a game is running.
///
/// Note:
/// - The Live Client Data API is served by the local League client at
///   http://127.0.0.1:2999
/// - No authentication is required for these endpoints.
class LiveClientService {
  LiveClientService({Dio? dio})
      : _api = Openapi(
          dio: dio,
          basePathOverride: 'http://127.0.0.1:2999',
        );

  final Openapi _api;

  Dio get _dio => _api.dio;

  /// GET /liveclientdata/allgamedata
  Future<Map<String, dynamic>> getAllGameData({int? eventId}) async {
    final res = await _dio.get(
      '/liveclientdata/allgamedata',
      queryParameters: eventId == null ? null : {'eventID': eventId},
    );
    return _asMap(res.data);
  }

  /// GET /liveclientdata/gamestats
  Future<Map<String, dynamic>> getGameStats() async {
    final res = await _dio.get('/liveclientdata/gamestats');
    return _asMap(res.data);
  }

  /// GET /liveclientdata/playerlist
  /// teamID can be ORDER or CHAOS, or null for all.
  Future<List<dynamic>> getPlayerList({String? teamId}) async {
    final res = await _dio.get(
      '/liveclientdata/playerlist',
      queryParameters: teamId == null ? null : {'teamID': teamId},
    );
    return _asList(res.data);
  }

  /// GET /liveclientdata/activeplayername
  Future<String?> getActivePlayerName() async {
    final res = await _dio.get('/liveclientdata/activeplayername');
    final data = res.data;
    if (data is String) return data;
    if (data is Map && data['name'] is String) return data['name'] as String;
    return data?.toString();
  }

  /// GET /liveclientdata/playerscores?riotId=Name#TAG
  Future<Map<String, dynamic>> getPlayerScores(String riotId) async {
    final res = await _dio.get(
      '/liveclientdata/playerscores',
      queryParameters: {'riotId': riotId},
    );
    return _asMap(res.data);
  }

  /// GET /liveclientdata/playeritems?riotId=Name#TAG
  Future<List<dynamic>> getPlayerItems(String riotId) async {
    final res = await _dio.get(
      '/liveclientdata/playeritems',
      queryParameters: {'riotId': riotId},
    );
    return _asList(res.data);
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) {
      return data.map((k, v) => MapEntry(k.toString(), v));
    }
    if (data is String) {
      return json.decode(data) as Map<String, dynamic>;
    }
    throw StateError('Unexpected response type: ${data.runtimeType}');
  }

  List<dynamic> _asList(dynamic data) {
    if (data is List) return data;
    if (data is String) {
      return json.decode(data) as List<dynamic>;
    }
    throw StateError('Unexpected response type: ${data.runtimeType}');
  }
}
