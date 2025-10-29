import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/country_dropdown.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/next_button.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/phone_number_description.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/phone_number_input.dart';
import 'package:zytronic_whatsapp_task/features/auth/presentation/widgets/phone_number_title.dart';

class PhoneVerificationBody extends StatefulWidget {
  const PhoneVerificationBody({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationBody> createState() => _PhoneVerificationBodyState();
}

class _PhoneVerificationBodyState extends State<PhoneVerificationBody> {
  final TextEditingController _phoneController = TextEditingController();
  String selectedCountry = 'Egypt';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            PhoneNumberTitle(),
            SizedBox(height: 24.h),
            PhoneNumberDescription(),
            SizedBox(height: 40.h),
            CountryDropdown(
              selectedCountry: selectedCountry,
              onCountryChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            PhoneNumberInput(controller: _phoneController),

            SizedBox(height: 300.h),
            NextButton(
              onPressed: () {
                final phone = _phoneController.text.trim();
                if (phone.isNotEmpty) {
                  context.read<AuthBloc>().add(SendOtpEvent(phone));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
