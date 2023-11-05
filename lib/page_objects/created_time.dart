class CreatedTime {
  final String id;
  final DateTime createdTime;

  CreatedTime({required this.id, required this.createdTime});

  factory CreatedTime.fromMap(Map<String, dynamic> json) {
    return CreatedTime(
      id: json['id'],
      createdTime: DateTime.parse(json['created_time']),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_time': createdTime,
    };
  }
}
