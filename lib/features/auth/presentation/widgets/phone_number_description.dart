import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberDescription extends StatelessWidget {
  const PhoneNumberDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
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
