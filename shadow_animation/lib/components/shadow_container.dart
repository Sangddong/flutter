import 'package:flutter/material.dart';

class ShadowAnimationContainer extends StatefulWidget {
  const ShadowAnimationContainer({super.key});

  @override
  State<ShadowAnimationContainer> createState() => _ShadowAnimationContainerState();
}

class _ShadowAnimationContainerState extends State<ShadowAnimationContainer> {
  // 그림자의 초기 목표값 설정
  double targetBlur = 4.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        // 목표값에 따라 시작값을 다르게 설정하여 자연스럽게 이어지도록 처리
        begin: targetBlur == 4.0 ? 2.0 : 4.0,
        end: targetBlur,
      ),
      duration: const Duration(seconds: 2), // 애니메이션 지속 시간
      onEnd: () {
        // 애니메이션이 끝나면 목표값을 반전시켜 다시 애니메이션 실행 (무한 반복)
        setState(() {
          targetBlur = targetBlur == 4.0 ? 2.0 : 4.0;
        });
      },
      builder: (context, value, child) {
        return Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent, // 그림자 색상
                  blurRadius: value * 5,     // 효과를 뚜렷하게 보기 위해 값 증폭
                  spreadRadius: value * 2,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              "Glow Effect",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}