class CheckBox {
  final String id;
  final String type;
  final String checkbox;

  CheckBox({required this.id, required this.type, required this.checkbox});

  factory CheckBox.fromMap(Map<String, dynamic> json) {
    return CheckBox(
      id: json['id'],
      type: json['type'],
      checkbox: json['checkbox'],
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'type':type,
      'checkbox':checkbox,
    };
  }
}
