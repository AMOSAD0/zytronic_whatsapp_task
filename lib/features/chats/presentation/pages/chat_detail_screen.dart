import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zytronic_whatsapp_task/config/theme/textStyles.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  const ChatDetailScreen({super.key, required this.name, required this.image});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _sendController;

  @override
  void initState() {
    super.initState();
    _sendController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _sendController.dispose();
    super.dispose();
  }

  void _onSendPressed() {
    if (_controller.text.isEmpty) return;
    _sendController.forward().then((_) => _sendController.reverse());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        titleSpacing: 0,
        backgroundColor: const Color(0xFF075E54),
        title: Row(
          children: [
            Hero(
              tag: widget.image,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
                radius: 18.r,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.name,
              style: AppTextStyles.appBarTitle(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox()), // chat content placeholder
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: AppTextStyles.inputHint(context),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _sendController,
                    curve: Curves.easeOutBack,
                  ),
                  child: GestureDetector(
                    onTap: _onSendPressed,
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: const Color(0xFF25D366),
                      child: const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
