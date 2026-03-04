import 'package:flutter/material.dart';
import 'package:shadow_animation/components/shadow_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(child: ShadowAnimationContainer(),));
  }
}
