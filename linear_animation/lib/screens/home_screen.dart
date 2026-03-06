import 'dart:async';
import 'package:flutter/material.dart';

import '../components/progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 진행률 최대값과 현재값 설정
  int totalValue = 100;
  int currentValue = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (currentValue < totalValue) {
          currentValue++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('진행 상황 테스트'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SimpleProgressIndicator(
            totalValue: totalValue,
            currentValue: currentValue,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentValue = 0;
            _timer?.cancel();
            _startProgress();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}