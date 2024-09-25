import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/repositories/repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final NetworkImpl network;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.network,
  });

  @override
  Future<Either<Failure, List<ListingModel>>> getAllListings() async {
    if (await network.isConnected) {
      try {
        final result = await remoteDataSource.getAllListings();
        return Right(result);
      } on ApiException catch (e) {
        return Left(APIFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('No internet connection. Check Your Internet Connection'));
    }
  }
  
  @override
  Future<Either<Failure, ListingModel>> getAllListing(String id)async {
    if (await network.isConnected) {
      try {
        final result = await remoteDataSource.getAllListing(id);
        return Right(result);
      } on ApiException catch (e) {
        return Left(APIFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('No internet connection. Check Your Internet Connection'));
    }
  }
}
