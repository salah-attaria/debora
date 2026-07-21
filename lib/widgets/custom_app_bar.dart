import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff015254),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}