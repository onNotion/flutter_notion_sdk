class Email {
  final String id;
  final String email;

  Email({required this.id, required this.email});
  
  factory Email.fromMap(Map<String, dynamic> json) {
    return Email(
      id: json['id'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
    };
  }
}
