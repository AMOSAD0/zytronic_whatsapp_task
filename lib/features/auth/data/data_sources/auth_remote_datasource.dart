import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> sendOtp(String phoneNumber);
  Future<UserModel> verifyOtp(String verificationId, String otp);
  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<String> sendOtp(String phoneNumber) async {
    try {
      final completer = Completer<String>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+201282662411',
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          if (!completer.isCompleted) {
            completer.complete('verified');
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.completeError(e.message ?? 'Verification failed');
          }
        },

        codeSent: (String verId, int? resendToken) async {
          const testOtp = '123456';
          final credential = PhoneAuthProvider.credential(
            verificationId: verId,
            smsCode: testOtp,
          );
          await _firebaseAuth.signInWithCredential(credential);

          if (!completer.isCompleted) {
            completer.complete(verId);
          }
        },

        codeAutoRetrievalTimeout: (String verId) {
          if (!completer.isCompleted) {
            completer.complete(verId);
          }
        },
      );

      return await completer.future;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to send OTP');
    }
  }

  @override
  Future<UserModel> verifyOtp(String verificationId, String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredential.user == null) {
        throw Exception('User not found after verification');
      }

      final user = userCredential.user!;

      return UserModel(
        uid: user.uid,
        phoneNumber: user.phoneNumber ?? '',
        createdAt: user.metadata.creationTime ?? DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        throw Exception('The entered code is invalid.');
      }
      throw Exception(e.message ?? 'Failed to verify OTP');
    } catch (e) {
      throw Exception('Failed to verify OTP: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }
}
