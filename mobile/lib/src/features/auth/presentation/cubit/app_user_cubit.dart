import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:mobile/src/features/auth/data/models/user_model.dart';

part 'app_user_state.dart';


class AppUserCubit extends Cubit<AppUserCubitState> {
  final AuthLocalDataSource localDataSource;

  AppUserCubit({required this.localDataSource}) : super(AppUserCubitInitial());

  // Load user from local storage
  Future<void> loadCachedUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
      if (cachedUser != null) {
        emit(AppUserLoaded(user: cachedUser));
      } else {
        debugPrint('No cached user found.');
        emit(AppUserNotLoggedIn());
      }
    } catch (e) {
      emit(AppUserError(message: 'Failed to load user data: $e'));
    }
  }

  // Clear user data from local storage
  Future<void> clearUser() async {
    try {
      await localDataSource.clearCachedUser();
      emit(AppUserNotLoggedIn());
    } catch (e) {
      emit(AppUserError(message: 'Failed to clear user data: $e'));
    }
  }
}
