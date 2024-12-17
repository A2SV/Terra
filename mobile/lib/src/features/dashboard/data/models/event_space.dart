import 'package:mobile/src/features/dashboard/domain/domain.dart';

class EventSpaceModel extends EventSpace {
  const EventSpaceModel({
    required super.maximumCapacity,
    required super.cateringServiceAvailable,
    required super.audioVisualEquipmentsAvailable,
    super.suitableEvents,
  });

  factory EventSpaceModel.fromJson(Map<String, dynamic> json) {
    return EventSpaceModel(
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

  EventSpaceModel copyWith({
    int? maximumCapacity,
    bool? cateringServiceAvailable,
    bool? audioVisualEquipmentsAvailable,
    List<EventSpaceSuitableEvents>? suitableEvents,
  }) {
    return EventSpaceModel(
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
