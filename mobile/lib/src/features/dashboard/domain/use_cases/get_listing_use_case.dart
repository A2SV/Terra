import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class GetListingParams {
  final String id;

  GetListingParams({
    required this.id,
  });
}
class GetListingUseCase extends UseCase<ListingModel, GetListingParams> {
  final DashboardRepository dashboardRepository;
  GetListingUseCase({required this.dashboardRepository});

  @override
  Future<Either<Failure, ListingModel>> call(GetListingParams params) async {
    return await dashboardRepository.getAllListing(params.id);
  }
}
