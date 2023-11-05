class CreatedBy {
  final String object;
  final String id;

  CreatedBy({required this.object, required this.id});

  factory CreatedBy.fromMap(Map<String, dynamic> json) {
    return CreatedBy(
      object: json['object'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'id': id,
    };
  }
}
