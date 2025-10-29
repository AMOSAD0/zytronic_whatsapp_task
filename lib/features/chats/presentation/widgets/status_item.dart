import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

class StatusItem extends StatelessWidget {
  final String name;
  final String time;
  final String imageUrl;
  final VoidCallback onTap;

  const StatusItem({
    super.key,
    required this.name,
    required this.time,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.teal.withOpacity(0.2),
      borderRadius: BorderRadius.circular(50.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Hero(
              tag: imageUrl,
              child: Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF25D366),
                    width: 3.w,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.chatName(context)),
                SizedBox(height: 4.h),
                Text(time, style: AppTextStyles.chatTime(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
