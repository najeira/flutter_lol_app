import '../utils/json.dart';
import 'game_event.dart';

class LiveEvents {
  const LiveEvents({required this.events});

  final List<GameEvent> events;

  factory LiveEvents.fromJson(Map<String, dynamic> json) => LiveEvents(
    events: asList(
      json['Events'],
    ).map((e) => GameEvent.fromJson(asMap(e))).toList(),
  );

  Map<String, dynamic> toJson() => {
    'Events': events.map((e) => e.toJson()).toList(),
  };
}
