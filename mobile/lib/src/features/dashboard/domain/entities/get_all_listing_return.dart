import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';

class GetAllListingsReturn extends Equatable {
  final List<ListingModel> items;
  final int pageIndex;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;

  const GetAllListingsReturn({
    required this.items,
    required this.pageIndex,
    required this.totalPages,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  @override
  List<Object?> get props => [
        items,
        pageIndex,
        totalPages,
        hasPreviousPage,
        hasNextPage,
      ];
}
