class Media {
  const Media({required this.id, required this.url});
  final String id;
  final String url;
  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      id: map['id'],
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }
  
}
