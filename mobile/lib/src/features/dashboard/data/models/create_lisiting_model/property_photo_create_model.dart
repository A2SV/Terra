class PropertyPhotoCreateModel {
  final String url;

  PropertyPhotoCreateModel({required this.url});

  PropertyPhotoCreateModel copyWith({String? url}) {
    return PropertyPhotoCreateModel(
      url: url ?? this.url,
    );
  }
}