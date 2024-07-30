class Workout {
  final String type;
  final int duration; // in minutes
  final DateTime date;

  Workout({required this.type, required this.duration, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'duration': duration,
      'date': date.toIso8601String(),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      type: map['type'],
      duration: map['duration'],
      date: DateTime.parse(map['date']),
    );
  }
}
