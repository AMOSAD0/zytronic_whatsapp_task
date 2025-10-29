import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/pages/story_view_screen.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/widgets/status_item.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = [
      {
        "name": "Martin Torff",
        "time": "5 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/31.jpg",
      },
      {
        "name": "Alfonso Rhiel Madsen",
        "time": "7 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/20.jpg",
      },
      {
        "name": "Carla Korsgaard",
        "time": "10 minutes ago",
        "image": "https://randomuser.me/api/portraits/women/26.jpg",
      },
      {
        "name": "Cristofer Passaquindici Arcand",
        "time": "12 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/45.jpg",
      },
      {
        "name": "Zaire Passaquindici Arcand",
        "time": "15 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/52.jpg",
      },
      {
        "name": "Martin Dorwart",
        "time": "16 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/18.jpg",
      },
      {
        "name": "Phillip Westervelt",
        "time": "18 minutes ago",
        "image": "https://randomuser.me/api/portraits/men/61.jpg",
      },
      {
        "name": "Terry Dokidis",
        "time": "20 minutes ago",
        "image": "https://randomuser.me/api/portraits/women/62.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'edit',
            onPressed: () {},
            child: const Icon(Icons.edit, color: Colors.white),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            heroTag: 'camera',
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            Text(
              'Recent Updates',
              style: AppTextStyles.titleSmall(
                context,
              ).copyWith(color: AppTextStyles.getSecondaryTextColor(context)),
            ),
            SizedBox(height: 10.h),
            ...statuses.map(
              (s) => StatusItem(
                name: s["name"]!,
                time: s["time"]!,
                imageUrl: s["image"]!,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => StoryViewPage(
                        name: s["name"]!,
                        imageUrl: s["image"]!,
                        time: s["time"]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
