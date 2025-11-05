class Alarm {
  final int id;
  final String time;
  String ringtone;
  final String repeat;
  bool isActive;
  final String label;

  Alarm({
    required this.id,
    required this.time,
    required this.ringtone,
    required this.repeat,
    required this.isActive,
    required this.label,
  });
}
