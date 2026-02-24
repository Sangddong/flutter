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
      padding: const EdgeInsets.symmetric(horizontal: 8), // 버튼 터치 영역 고려
      child: Stack(
        alignment: Alignment.center, // Stack 내부 자식들을 중앙 정렬
        children: [
          // 1. 뒤로가기 버튼 (왼쪽 고정)
          if (showBack)
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),

          // 2. 제목 (무조건 물리적 중앙)
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          // 3. 액션 버튼 (오른쪽 고정)
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
