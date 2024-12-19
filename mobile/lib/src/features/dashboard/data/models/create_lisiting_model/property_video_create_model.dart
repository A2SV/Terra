class PropertyVideoCreateModel {
  final String url;

  PropertyVideoCreateModel({required this.url});

  PropertyVideoCreateModel copyWith({String? url}) {
    return PropertyVideoCreateModel(
      url: url ?? this.url,
    );
  }
}