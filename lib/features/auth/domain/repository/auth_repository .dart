import 'package:dartz/dartz.dart';
import 'package:zytronic_whatsapp_task/core/error/error.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signupPhone(String phoneNumber, String name);
  Future<Either<Failure, UserEntity?>> getCachedUser();
  Future<Either<Failure, void>> cacheUser(UserEntity user);
  Future<Either<Failure, void>> signOut();
}
