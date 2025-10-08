import '../utils/json.dart';

class GameEvent {
  const GameEvent({required this.eventID, required this.eventName, required this.eventTime});

  final int eventID;
  final String eventName;
  final double eventTime;

  factory GameEvent.fromJson(Map<String, dynamic> json) => GameEvent(
        eventID: asInt(json['EventID']),
        eventName: asString(json['EventName']),
        eventTime: asDouble(json['EventTime']),
      );

  Map<String, dynamic> toJson() => {
        'EventID': eventID,
        'EventName': eventName,
        'EventTime': eventTime,
      };
}
