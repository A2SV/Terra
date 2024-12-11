import 'package:mobile/src/features/dashboard/domain/entities/media.dart';

class MediaModel extends Media {
  const MediaModel({required super.id, required super.url});

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
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
