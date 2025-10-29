import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberInput({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.w,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.w,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
