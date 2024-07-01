import 'package:equatable/equatable.dart';
import 'exception.dart';

abstract class Failure extends Equatable {
  abstract final String errorMessage;
  @override
  List<Object?> get props => [];
}
