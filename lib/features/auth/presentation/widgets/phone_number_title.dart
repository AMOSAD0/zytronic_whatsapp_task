import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberTitle extends StatelessWidget {
  const PhoneNumberTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter your phone number',
      style: TextStyle(
        //
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
