class GameEvent {
  const GameEvent({required this.eventID, required this.eventName, required this.eventTime});

  final int eventID;
  final String eventName;
  final double eventTime;

  factory GameEvent.fromJson(Map<String, dynamic> json) => GameEvent(
        eventID: (json['EventID'] as num?)?.toInt() ?? 0,
        eventName: (json['EventName'] as String?) ?? '',
        eventTime: (json['EventTime'] is num)
            ? (json['EventTime'] as num).toDouble()
            : 0.0,
      );

  Map<String, dynamic> toJson() => {
        'EventID': eventID,
        'EventName': eventName,
        'EventTime': eventTime,
      };
}
