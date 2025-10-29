import 'package:flutter/material.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

class PhoneNumberTitle extends StatelessWidget {
  const PhoneNumberTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter your phone number',
      style: AppTextStyles.titleLarge(context),
    );
  }
}
