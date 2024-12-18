import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/domain/repositories/repository.dart';
import 'package:mobile/src/features/dashboard/domain/use_cases/get_listing_use_case.dart';

class GetListingByIdUseCase
    implements UseCase<ListingDetailModel, ListingParams> {
  final DashboardRepository dashboardRepository;
  GetListingByIdUseCase({required this.dashboardRepository});

  @override
  Future<Either<Failure, ListingDetailModel>> call(ListingParams params) async {
    return await dashboardRepository.getAllListingById(params.id);
  }
}

