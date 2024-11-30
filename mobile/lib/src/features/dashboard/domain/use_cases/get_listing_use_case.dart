import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/repositories/repository.dart';

class GetListingUseCase implements UseCase<ListingModel, ListingParams> {
  final DashboardRepository dashboardRepository;
  GetListingUseCase({required this.dashboardRepository});

  @override
  Future<Either<Failure, ListingModel>> call(ListingParams params) async {
    var response=await dashboardRepository.getAllListings();
    var output;
    List<ListingModel> listings=[];
    response.fold(
        (failure)=>output=failure,
        (listings_return)=>output=listings_return
    );

    for (ListingModel item in listings){
      if (item.id==params.id){
        return Right(item);
      }
    }

    return Left(output);
  }
}

class ListingParams {
  final String id;
  ListingParams({
    required this.id,
  });
}
