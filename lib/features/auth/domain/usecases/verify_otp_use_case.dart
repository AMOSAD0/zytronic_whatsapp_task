import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/core/error/error.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/entities/user_entity.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/repository/auth_repository%20.dart';

@lazySingleton
class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String verificationId,
    String otp,
  ) async {
    return await repository.verifyOtp(verificationId, otp);
  }
}
