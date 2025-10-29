import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberInput({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFF00A884), width: 2.w),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                '20',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00A884), width: 2.w),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00A884), width: 2.w),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00A884), width: 2.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
