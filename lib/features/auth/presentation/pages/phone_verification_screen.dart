import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zytronic_whatsapp_task/di/injection.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/phone_verification_body.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _verificationId;

    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is OtpSent) {
              _verificationId = state.verificationId;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال كود التحقق')),
              );
            }

            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return PhoneVerificationBody();
          },
        ),
      ),
    );
  }
}
