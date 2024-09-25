import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/dashboard/data/models/get_all_listings.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';

abstract class DashboardRemoteDataSource {
  Future<ListingModel> getAllListing(String id);
  Future<List<ListingModel>> getAllListings();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final http.Client _client;

  DashboardRemoteDataSourceImpl(this._client);

  @override
  Future<ListingModel> getAllListing(String id) async {
    final response = await _client.get(
      Uri.parse('${AppStrings.getAllListingEndPoint}$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final listingReturn = ListingModel.fromJson(json.decode(response.body));
      return listingReturn;
    }
    print(response.body);
    throw ApiException(response.body);
  }

  @override
  Future<List<ListingModel>> getAllListings() async {
    // String token = '';
    final response = await _client.get(
      Uri.parse(AppStrings.getAllListingsEndPoint),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // List<dynamic> data = json.decode(response.body);
      // List<ListingModel> listings = [];
      // for (var item in data) {
      //   listings.add(ListingModel.fromJson(item));
      // }
      // print(json.decode(response.body));
      final listingReturn =
          GetAllListingsModel.fromJson(json.decode(response.body));
      return listingReturn.items.reversed.toList();
    }
    // print(response.body);
    throw ApiException(response.body);
  }
}
