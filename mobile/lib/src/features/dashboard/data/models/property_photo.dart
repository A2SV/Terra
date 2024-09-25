import 'package:mobile/src/features/dashboard/domain/entities/property_photo.dart';

class PropertyPhotoModel extends PropertyPhoto {
  const PropertyPhotoModel({
    required super.id,
    required super.url,
  });

  factory PropertyPhotoModel.fromJson(Map<String, dynamic> json) {
    return PropertyPhotoModel(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
