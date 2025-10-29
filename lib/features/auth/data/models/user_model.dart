import 'package:hive/hive.dart';
import 'package:zytronic_whatsapp_task/features/auth/domain/entities/user_entity.dart';

// part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String phoneNumber;

  @HiveField(2)
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.createdAt,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(uid: uid, phoneNumber: phoneNumber, createdAt: createdAt);
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      phoneNumber: entity.phoneNumber,
      createdAt: entity.createdAt,
    );
  }
}
