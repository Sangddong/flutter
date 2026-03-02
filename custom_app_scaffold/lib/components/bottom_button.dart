import 'package:flutter/material.dart';

class BottomButtonItem extends StatelessWidget {
  final VoidCallback onPressed;
  final Text buttonContent;

  const BottomButtonItem({
    required this.onPressed,
    required this.buttonContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white
      ),
      onPressed: onPressed,
      child: buttonContent
    );
  }
}
