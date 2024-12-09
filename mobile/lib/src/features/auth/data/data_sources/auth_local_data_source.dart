import 'package:hive/hive.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getCachedUser();
  Future<void> clearCachedUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _userBox;

  AuthLocalDataSourceImpl(this._userBox);

  static const String userKey = 'cached_user';

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      _userBox.put(userKey, user.toJson());
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<UserModel> getCachedUser() async {
    final json = _userBox.get(userKey);
    if (json != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(json));
    }
    throw const CacheException('User does not exist');
  }

  @override
  Future<void> clearCachedUser() async {
    await _userBox.delete(userKey);
  }
}
