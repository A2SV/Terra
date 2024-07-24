import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';

abstract class DashboardRemoteDataSource {
  Future<List<ListingModel>> getAllListings();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final http.Client _client;

  DashboardRemoteDataSourceImpl(this._client);

  @override
  Future<List<ListingModel>> getAllListings() async {
    String token = '';
    final response = await _client.post(
      Uri.parse(AppStrings.otpEndPoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<ListingModel> listings = [];
      for (var item in data) {
        listings.add(ListingModel.fromJson(item));
      }
      return listings;
    }
    throw ApiException(response.body);
  }
}
