import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

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
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2.w),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedCountry,
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down, size: 24.sp),
        style: AppTextStyles.bodyLarge(context),
        items: ['Egypt', 'United States', 'United Kingdom', 'India']
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
