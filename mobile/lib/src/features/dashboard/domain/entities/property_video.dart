import 'package:equatable/equatable.dart';

class PropertyVideo extends Equatable {
  final String id;
  final String url;

  const PropertyVideo({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [id, url];
}
