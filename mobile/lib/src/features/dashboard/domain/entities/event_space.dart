import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class EventSpace extends Equatable {
  final int maximumCapacity;
  final bool cateringServiceAvailable;
  final bool audioVisualEquipmentsAvailable;
  final List<EventSpaceSuitableEvents>? suitableEvents;

  const EventSpace({
    required this.maximumCapacity,
    required this.cateringServiceAvailable,
    required this.audioVisualEquipmentsAvailable,
    this.suitableEvents,
  });

  @override
  List<Object?> get props => [
        maximumCapacity,
        cateringServiceAvailable,
        audioVisualEquipmentsAvailable,
        suitableEvents,
      ];
}
