import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zytronic_whatsapp_task/config/constants/constants.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/pages/phone_verification_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/phone_verification',
  routes: [
    GoRoute(
      path: '/phone_verification',
      name: Constants.phoneVerification,

      pageBuilder: (context, state) =>
          buildTransitionPage(const PhoneVerificationScreen()),
    ),
  ],
);

CustomTransitionPage buildTransitionPage(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 550),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    },
    child: child,
  );
}
