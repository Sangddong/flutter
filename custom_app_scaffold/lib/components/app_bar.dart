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
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // back button
          if (showBack)
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

          // title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          // action buttons
          if (actions != null)
            Positioned(
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }
}
