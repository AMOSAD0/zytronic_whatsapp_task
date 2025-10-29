import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/pages/home_sceen.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/widgets/chat_tile.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ChatTile(chat: chat);
              },
              separatorBuilder: (_, __) => Divider(
                indent: 70.w,
                height: 1.h,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF128C7E),
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
