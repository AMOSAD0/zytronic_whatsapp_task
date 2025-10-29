import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/get_cached_user_use_case.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/send_otp_use_case.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/signout_use_case.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/verify_otp_use_case.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final GetCachedUserUseCase getCachedUserUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
    required this.getCachedUserUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await sendOtpUseCase(event.phoneNumber);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (verificationId) => emit(OtpSent(verificationId)),
    );
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await verifyOtpUseCase(event.verificationId, event.otp);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
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
