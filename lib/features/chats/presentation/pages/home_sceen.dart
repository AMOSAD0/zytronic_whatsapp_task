import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';
import 'package:zytronic_whatsapp_task/features/app/bloc/theme_bloc.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/pages/chats_screen.dart';
import 'package:zytronic_whatsapp_task/features/chats/presentation/pages/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('WhatsApp', style: AppTextStyles.appBarTitle(context)),
        actions: [
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 16.w),
          Icon(Icons.search),
          SizedBox(width: 16.w),

          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'theme') {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              }
            },
            itemBuilder: (BuildContext context) {
              final isDark =
                  context.read<ThemeBloc>().state.themeMode == ThemeMode.dark;

              return [
                PopupMenuItem<String>(
                  value: 'theme',
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),

          SizedBox(width: 10.w),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          tabs: const [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [ChatsScreen(), StatusScreen()],
      ),
    );
  }
}

final List<Map<String, dynamic>> chats = [
  {
    'name': 'Martin Torff',
    'message': "Let's Meet",
    'time': '11:48',
    'unread': 123,
    'image': 'https://i.pravatar.cc/150?img=1',
  },
  {
    'name': 'Alfonso Rhiel Madsen',
    'message': "Yes, That's correct!",
    'time': '09:21',
    'unread': 0,
    'image': 'https://i.pravatar.cc/150?img=2',
  },
  {
    'name': 'Carla Korsgaard',
    'message': "Nice",
    'time': '11:48',
    'unread': 0,
    'image': 'https://i.pravatar.cc/150?img=3',
  },
];
