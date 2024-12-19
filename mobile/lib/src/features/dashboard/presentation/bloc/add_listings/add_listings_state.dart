import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/create_listing_request_model.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/add_listings/add_listing_status.dart';

class AddListingsState {
  final CreateListingRequestModel request;
  final AddListingsStatus status;
  final String? errorMessage;

  AddListingsState({
    required this.request,
    required this.status,
    this.errorMessage,
  });

  AddListingsState copyWith({
    CreateListingRequestModel? request,
    AddListingsStatus? status,
    String? errorMessage,
  }) {
    return AddListingsState(
      request: request ?? this.request,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}