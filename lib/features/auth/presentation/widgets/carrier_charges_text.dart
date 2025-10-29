import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarrierChargesText extends StatelessWidget {
  const CarrierChargesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Carrier charges may apply',
      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
    );
  }
}
