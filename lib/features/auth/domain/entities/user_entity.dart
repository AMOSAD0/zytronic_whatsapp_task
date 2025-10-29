import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String phoneNumber;
  final String name;
  final DateTime createdAt;

  const UserEntity({
    required this.uid,
    required this.phoneNumber,
    required this.name,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [uid, phoneNumber, createdAt, name];
}
