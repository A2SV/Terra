import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/entities/get_all_listing_return.dart';

class GetAllListingsModel extends GetAllListingsReturn {
  const GetAllListingsModel(
      {required super.items,
      required super.pageIndex,
      required super.totalPages,
      required super.hasPreviousPage,
      required super.hasNextPage});
  factory GetAllListingsModel.fromJson(Map<String, dynamic> json) {
    return GetAllListingsModel(
      items: (json['items'] as List<dynamic>)
          .map((item) => ListingModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      pageIndex: json['pageIndex'] ?? 1,
      totalPages: json['totalPages'] ?? 0,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
      hasNextPage: json['hasNextPage'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((ListingModel item) => item.toJson()).toList(),
      'pageIndex': pageIndex,
      'totalPages': totalPages,
      'hasPreviousPage': hasPreviousPage,
      'hasNextPage': hasNextPage,
    };
  }
}
