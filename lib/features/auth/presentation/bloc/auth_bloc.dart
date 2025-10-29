import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/get_cached_user_use_case.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/signup_phone_use_case.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/signout_use_case.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupPhoneUseCase signupPhoneUseCase;
  final GetCachedUserUseCase getCachedUserUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.signupPhoneUseCase,
    required this.getCachedUserUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<SignupPhoneEvent>(_onSignupPhone);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignupPhone(
    SignupPhoneEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signupPhoneUseCase(event.phoneNumber, event.name);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (verificationId) => emit(SignupPhone(verificationId)),
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await getCachedUserUseCase();

    result.fold((failure) => emit(AuthUnauthenticated()), (user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    });
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await signOutUseCase();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }
}
