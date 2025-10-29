import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<String> signupPhone(String phoneNumber, String name);
  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  AuthRemoteDataSourceImpl(this._firebaseAuth, this._firestore);

  @override
  Future<String> signupPhone(String phoneNumber, String name) async {
    try {
      final completer = Completer<String>();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) async {
          final userCredential = await _firebaseAuth.signInWithCredential(
            credential,
          );
          final user = userCredential.user;

          if (user != null) {
            await _firestore.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'name': name,
              'phone': phoneNumber,
              'createdAt': FieldValue.serverTimestamp(),
            }, SetOptions(merge: true));
          }

          if (!completer.isCompleted) completer.complete('verified');
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.completeError(e.message ?? 'Verification failed');
          }
        },

        codeSent: (String verId, int? resendToken) async {
          // ✅ هنا بنعمل تسجيل دخول تجريبي باستخدام testOtp
          const testOtp = '123456';
          final credential = PhoneAuthProvider.credential(
            verificationId: verId,
            smsCode: testOtp,
          );

          final userCredential = await _firebaseAuth.signInWithCredential(
            credential,
          );
          final user = userCredential.user;

          // ✅ حفظ بيانات المستخدم في Firestore بعد تسجيل الدخول
          if (user != null) {
            await _firestore.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'name': name,
              'phone': phoneNumber,
              'createdAt': FieldValue.serverTimestamp(),
            }, SetOptions(merge: true));
          }

          if (!completer.isCompleted) completer.complete(verId);
        },

        codeAutoRetrievalTimeout: (String verId) {
          if (!completer.isCompleted) completer.complete(verId);
        },
      );

      return await completer.future;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to send OTP');
    }
  }

  // @override
  // Future<UserModel> verifyOtp(String verificationId, String otp) async {
  //   try {
  //     final credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: otp,
  //     );

  //     final userCredential = await _firebaseAuth.signInWithCredential(
  //       credential,
  //     );

  //     if (userCredential.user == null) {
  //       throw Exception('User not found after verification');
  //     }

  //     final user = userCredential.user!;

  //     return UserModel(
  //       uid: user.uid,
  //       phoneNumber: user.phoneNumber ?? '',
  //       createdAt: user.metadata.creationTime ?? DateTime.now(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'invalid-verification-code') {
  //       throw Exception('The entered code is invalid.');
  //     }
  //     throw Exception(e.message ?? 'Failed to verify OTP');
  //   } catch (e) {
  //     throw Exception('Failed to verify OTP: ${e.toString()}');
  //   }
  // }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }
}
