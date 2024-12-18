import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/data/models/get_all_listings.dart';

abstract class DashboardRemoteDataSource {
  Future<List<ListingModel>> getAllListings();

  Future<ListingDetailModel> getListingById(String id);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final http.Client _client;

  DashboardRemoteDataSourceImpl(this._client);

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
      final listingReturn =
          GetAllListingsModel.fromJson(json.decode(response.body));
      return listingReturn.items;
    }
    throw ApiException(response.body);
  }

  @override
  Future<ListingDetailModel> getListingById(String id) async {
    // String token = '';
    final response = await _client.get(
      Uri.parse("${AppStrings.getListingByIdEndPoint}$id"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final listingReturn =
          ListingDetailModel.fromJson(json.decode(response.body));
      return listingReturn;
    }
    throw ApiException(response.body);
  }
}
