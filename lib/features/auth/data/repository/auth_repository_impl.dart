import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/core/error/error.dart';
import 'package:zytronic_whatsapp_task/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:zytronic_whatsapp_task/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/repository/auth_repository%20.dart';
import '../../domain/entities/user_entity.dart';

import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, String>> signupPhone(
    String phoneNumber,
    String name,
  ) async {
    try {
      final verificationId = await remoteDataSource.signupPhone(
        phoneNumber,
        name,
      );
      return Right(verificationId);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCachedUser() async {
    try {
      final userModel = await localDataSource.getCachedUser();
      return Right(userModel?.toEntity());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheUser(UserEntity user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      await localDataSource.cacheUser(userModel);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
