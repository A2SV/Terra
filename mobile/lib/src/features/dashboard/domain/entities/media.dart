import 'package:equatable/equatable.dart';

class Media extends Equatable {
  const Media({required this.id, required this.url});
  final String id;
  final String url;

  @override
  List<Object?> get props => [id, url];
}
