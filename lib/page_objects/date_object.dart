class DateObject {
  DateTime? end;
  DateTime? start;
  DateObject({this.end, this.start});

  factory DateObject.fromMap(Map<String, dynamic> json) {
    return DateObject(
      end: json.containsKey('end') ? DateTime.parse(json['end']) : null,
      start:json.containsKey('start')? DateTime.parse(json['start']) : null,
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (end != null) {
      map['end'] = end.toString();
    }
    if (start != null) {
      map['start'] = start.toString();
    }
    return map;
  }
}
