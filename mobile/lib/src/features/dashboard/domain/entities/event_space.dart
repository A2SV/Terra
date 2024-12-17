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

  factory EventSpace.fromJson(Map<String, dynamic> json) {
    return EventSpace(
      maximumCapacity: json['maximumCapacity'],
      cateringServiceAvailable: json['cateringServiceAvailable'],
      audioVisualEquipmentsAvailable: json['audioVisualEquipmentsAvailable'],
      suitableEvents: json['suitableEvents'] != null
          ? (json['suitableEvents'] as List)
              .map((e) => EventSpaceSuitableEvents.values
                  .firstWhere((type) => type.name == e))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [
        maximumCapacity,
        cateringServiceAvailable,
        audioVisualEquipmentsAvailable,
        suitableEvents,
      ];

  EventSpace copyWith({
    int? maximumCapacity,
    bool? cateringServiceAvailable,
    bool? audioVisualEquipmentsAvailable,
    List<EventSpaceSuitableEvents>? suitableEvents,
  }) {
    return EventSpace(
      maximumCapacity: maximumCapacity ?? this.maximumCapacity,
      cateringServiceAvailable:
          cateringServiceAvailable ?? this.cateringServiceAvailable,
      audioVisualEquipmentsAvailable:
          audioVisualEquipmentsAvailable ?? this.audioVisualEquipmentsAvailable,
      suitableEvents: suitableEvents ?? this.suitableEvents,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximumCapacity': maximumCapacity,
      'cateringServiceAvailable': cateringServiceAvailable,
      'audioVisualEquipmentsAvailable': audioVisualEquipmentsAvailable,
      'suitableEvents': suitableEvents?.map((e) => e.name).toList(),
    };
  }
}
