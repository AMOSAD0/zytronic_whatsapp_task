import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/core/error/error.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/repository/auth_repository%20.dart';

@lazySingleton
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
