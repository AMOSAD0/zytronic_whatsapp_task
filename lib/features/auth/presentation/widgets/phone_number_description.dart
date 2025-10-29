import 'package:flutter/material.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

class PhoneNumberDescription extends StatelessWidget {
  const PhoneNumberDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.bodyMedium(context),
        children: [
          TextSpan(text: 'WhatsApp will need to verify your phone number. '),
          TextSpan(
            text: "What's my number?",
            style: TextStyle(
              color: Color(0xFF0D8CF2),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
