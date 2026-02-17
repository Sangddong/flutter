import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const AppBarItem({
    required this.title,
    this.showBack = true,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
