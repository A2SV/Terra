import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/src/core/entities/user_account.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserCubitState> {
  AppUserCubit() : super(AppUserInitial());

  void userLoggedIn(UserAccount user) {
    emit(AppUserLoggedIn(user: user));
  }

  void userLoggedOut() {
    emit(AppUserInitial());
  }

  void userError() {
    emit(AppUserError(message: "An unexpected error occured"));
  }
}
