import 'package:flutter/material.dart';

class SimpleProgressIndicator extends StatelessWidget {
  final int totalValue;
  final int currentValue;

  const SimpleProgressIndicator({
    super.key,
    required this.totalValue,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    // 진행률 계산 (0.0 ~ 1.0 사이의 값으로 변환)
    final double progressValue = totalValue > 0 ? currentValue / totalValue : 0.0;

    // 퍼센트 텍스트 계산
    final int percent = (progressValue * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 진행률 텍스트 정보
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "진행 상황",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$percent%",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),

          // 프로그레스 바
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.blueAccent.withValues(alpha: 0.2),
            color: Colors.blueAccent,
            minHeight: 8.0, // 프로그레스 바의 두께 설정
            borderRadius: BorderRadius.circular(4.0), // 양 끝 모서리 둥글게 처리
          ),
        ],
      ),
    );
  }
}