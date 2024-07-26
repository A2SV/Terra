import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/repositories/repository.dart';

class GetListingsUseCase extends UseCase<List<ListingModel>, NoParams> {
  final DashboardRepository dashboardRepository;
  GetListingsUseCase({required this.dashboardRepository});

  @override
  Future<Either<Failure, List<ListingModel>>> call(NoParams params) async {
    return await dashboardRepository.getAllListings();
  }
}
