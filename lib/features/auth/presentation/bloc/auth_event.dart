import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupPhoneEvent extends AuthEvent {
  final String phoneNumber;
  final String name;

  const SignupPhoneEvent({required this.phoneNumber, required this.name});

  @override
  List<Object> get props => [phoneNumber, name];
}

class CheckAuthStatusEvent extends AuthEvent {
  const CheckAuthStatusEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
