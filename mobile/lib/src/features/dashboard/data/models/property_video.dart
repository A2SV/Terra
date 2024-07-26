import 'package:mobile/src/features/dashboard/domain/entities/property_Video.dart';

class PropertyVideoModel extends PropertyVideo {
  const PropertyVideoModel({
    required super.id,
    required super.url,
  });

  factory PropertyVideoModel.fromJson(Map<String, dynamic> json) {
    return PropertyVideoModel(
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
