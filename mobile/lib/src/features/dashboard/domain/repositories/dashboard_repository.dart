import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<ListingModel>>> getAllListings();
  Future<Either<Failure, ListingDetailModel>> getAllListingById(String id);
}
