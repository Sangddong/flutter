import 'package:flutter/material.dart';

class  extends StatefulWidget {
  const ({super.key});

  @override
  State<> createState() => _State();
}

class _State extends State<> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
