class Document {
  int? id;
  String name;
  String path;
  String size;
  Document({
    this.id,
    required this.name,
    required this.path,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'size': size,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      name: map['name'],
      path: map['path'],
      size: map['size'],
    );
  }

  @override
  String toString() => 'Document(name: $name, path: $path, size: $size)';
}
