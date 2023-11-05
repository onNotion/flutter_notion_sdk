class FileObject {
  final String name;
  final String url;

  FileObject({required this.name, required this.url});
  
  factory FileObject.fromMap(Map<String, dynamic> json) {
    return FileObject(
      name: json.containsKey('name')? json['name'] : '',
      url: json.containsKey('external')? json['external']['url'] : json['url'],
    );
  }

}
