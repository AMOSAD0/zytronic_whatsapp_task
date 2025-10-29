import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDropdown extends StatelessWidget {
  final String selectedCountry;
  final Function(String) onCountryChanged;

  const CountryDropdown({
    Key? key,
    required this.selectedCountry,
    required this.onCountryChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF00A884), width: 2.w),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedCountry,
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down, size: 24.sp),
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
        items: ['India', 'United States', 'United Kingdom', 'Egypt']
            .map(
              (country) =>
                  DropdownMenuItem(value: country, child: Text(country)),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            onCountryChanged(value);
          }
        },
      ),
    );
  }
}
