import 'game_event.dart';

class LiveEvents {
  const LiveEvents({required this.events});

  final List<GameEvent> events;

  factory LiveEvents.fromJson(Map<String, dynamic> json) => LiveEvents(
        events: (json['Events'] as List<dynamic>? ?? const [])
            .map((e) => GameEvent.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Events': events.map((e) => e.toJson()).toList(),
      };
}
