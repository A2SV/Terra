import 'package:equatable/equatable.dart';

class PropertyPhoto extends Equatable {
  final String id;
  final String url;

  const PropertyPhoto({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [id, url];
}
