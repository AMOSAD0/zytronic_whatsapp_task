import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/pages/chat_detail_screen.dart';

class ChatTile extends StatelessWidget {
  final Map<String, dynamic> chat;
  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: ChatDetailScreen(
                  name: chat['name'],
                  image: chat['image'],
                ),
              );
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            Hero(
              tag: chat['image'],
              child: CircleAvatar(
                radius: 26.r,
                backgroundImage: NetworkImage(chat['image']),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat['name'], style: AppTextStyles.chatName(context)),
                  SizedBox(height: 4.h),
                  Text(
                    chat['message'],
                    style: AppTextStyles.chatMessage(context),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(chat['time'], style: AppTextStyles.chatTime(context)),
                if (chat['unread'] > 0)
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF25D366),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      chat['unread'].toString(),
                      style: AppTextStyles.badge(context),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
