import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/core/error/error.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/repository/auth_repository%20.dart';

@lazySingleton
class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, String>> call(String phoneNumber) async {
    return await repository.sendOtp(phoneNumber);
  }
}
