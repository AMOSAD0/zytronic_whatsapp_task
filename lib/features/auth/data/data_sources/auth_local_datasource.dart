import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _boxName = 'userBox';
  static const String _userKey = 'current_user';

  @override
  Future<UserModel?> getCachedUser() async {
    final box = await Hive.openBox<UserModel>(_boxName);
    return box.get(_userKey);
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(_boxName);
    await box.put(_userKey, user);
  }

  @override
  Future<void> clearCache() async {
    final box = await Hive.openBox<UserModel>(_boxName);
    await box.clear();
  }
}
